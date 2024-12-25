# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="2053cfabfafaeab65aff0bc083a83b105a939202"

DESCRIPTION="C++ implementation of the Jinja2 Python template engine"
HOMEPAGE="https://github.com/jinja2cpp/Jinja2Cpp"
SRC_URI="https://github.com/jinja2cpp/Jinja2Cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/expected-lite
	dev-cpp/variant-lite
	dev-cpp/optional-lite
	dev-cpp/string-view-lite
	dev-libs/libfmt
	dev-libs/rapidjson
	dev-libs/boost
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/removed-unused-boost-libs.patch
	"${FILESDIR}"/system-dep.patch
	"${FILESDIR}"/fmt-fix.patch
)

S="${WORKDIR}"/Jinja2Cpp-${EGIT_COMMIT}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_STANDARD=14
		-DJINJA2CPP_BUILD_TESTS=OFF
		-DJINJA2CPP_BUILD_SHARED=ON
		-DJINJA2CPP_PIC=ON
		-DJINJA2CPP_DEPS_MODE="external"
	)
	cmake_src_configure
}
