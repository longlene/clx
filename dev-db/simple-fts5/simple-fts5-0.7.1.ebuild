# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="SQLite FTS5 tokenizer supporting Chinese word segmentation and Pinyin"
HOMEPAGE="https://github.com/wangfenjin/simple"
SRC_URI="https://github.com/wangfenjin/simple/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/simple-${PV}"

LICENSE="|| ( MIT GPL-3+ )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+jieba"

DEPEND="
	dev-db/sqlite:=
	jieba? ( dev-cpp/cppjieba )
"
RDEPEND="
	jieba? ( dev-cpp/cppjieba )
"

src_prepare() {
	# Use system sqlite3 headers instead of the bundled amalgamation in
	# contrib/sqlite3 (also avoids building that amalgamation as a static
	# lib, which BUILD_SQLITE3=OFF below skips entirely).
	sed -i \
		"s|set(SQLITE3_HEADERS_DIR \${PROJECT_SOURCE_DIR}/contrib/sqlite3)|set(SQLITE3_HEADERS_DIR /usr/include)|" \
		CMakeLists.txt || die

	# src/CMakeLists.txt fetches yanyiwu/cppjieba via ExternalProject_Add
	# (network access, unavailable in the portage sandbox) and installs
	# the loadable extension into ${prefix}/bin instead of the lib dir.
	# Point it at the system dev-cpp/cppjieba package instead, and fix
	# the install location.
	eapply "${FILESDIR}/${PN}-0.7.1-system-cppjieba.patch"

	# jieba_dict_path defaults to the relative "./dict/", which only
	# works when the process cwd happens to contain a dict/ directory.
	# Point it at the dict files dev-cpp/cppjieba installs system-wide.
	sed -i \
		's|std::string jieba_dict_path = "./dict/";|std::string jieba_dict_path = "/usr/share/cppjieba/dict/";|' \
		src/simple_tokenizer.cc || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SQLITE3=OFF
		-DBUILD_TEST_EXAMPLE=OFF
		-DSIMPLE_WITH_JIEBA=$(usex jieba ON OFF)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	einstalldocs
}
