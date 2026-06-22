# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_CCTZ_REV="8ca8e32"
MY_UA_VER="0.7.2"
MY_XXH_REV="72997b0"

DESCRIPTION="Fast open source full-text search engine"
HOMEPAGE="https://manticoresearch.com https://github.com/manticoresoftware/manticoresearch"
SRC_URI="
	https://github.com/manticoresoftware/manticoresearch/archive/refs/tags/release-${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/manticoresoftware/cctz/archive/${MY_CCTZ_REV}.zip -> manticoresearch-cctz-${MY_CCTZ_REV}.zip
	https://github.com/manticoresoftware/uni-algo/archive/refs/tags/v${MY_UA_VER}.tar.gz -> ms-ua-${MY_UA_VER}.tar.gz
	https://github.com/manticoresoftware/xxHash/archive/${MY_XXH_REV}.zip -> ms-xxhash-${MY_XXH_REV}.zip
"

S="${WORKDIR}/manticoresearch-release-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+curl +ssl +zlib +zstd expat mysql odbc postgres"

DEPEND="
	dev-cpp/nlohmann_json
	dev-libs/boost:=
	dev-libs/icu:=
	dev-libs/re2:=
	dev-libs/snowball-stemmer
	curl? ( net-misc/curl )
	expat? ( dev-libs/expat )
	mysql? ( dev-db/mysql-connector-c:= )
	odbc? ( dev-db/unixODBC )
	postgres? ( dev-db/postgresql:= )
	ssl? ( dev-libs/openssl:= )
	zlib? ( sys-libs/zlib-ng[compat(+)] )
	zstd? ( app-arch/zstd:= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	virtual/pkgconfig
"

src_prepare() {
	# Use dynamic OpenSSL/Boost libraries (portage does not install static variants by default)
	sed -i 's/set ( OPENSSL_USE_STATIC_LIBS ON )/set ( OPENSSL_USE_STATIC_LIBS OFF )/' \
		CMakeLists.txt || die
	sed -i 's/set ( Boost_USE_STATIC_LIBS ON )/set ( Boost_USE_STATIC_LIBS OFF )/' \
		src/CMakeLists.txt || die

	# Declare UNI_ALGO_DISABLE_* as cmake options in the bundled uni-algo so the
	# -D flags passed by GetUniAlgo.cmake actually take effect as compile definitions.
	eapply "${FILESDIR}/${P}-unialgo-cmake-options.patch"

	mkdir -p "${WORKDIR}/libs_bundle" || die
	cp "${DISTDIR}/manticoresearch-cctz-${MY_CCTZ_REV}.zip" \
		"${WORKDIR}/libs_bundle/cctz-${MY_CCTZ_REV}.zip" || die
	cp "${DISTDIR}/ms-ua-${MY_UA_VER}.tar.gz" \
		"${WORKDIR}/libs_bundle/unialgo-v${MY_UA_VER}.tar.gz" || die
	cp "${DISTDIR}/ms-xxhash-${MY_XXH_REV}.zip" \
		"${WORKDIR}/libs_bundle/xxHash-${MY_XXH_REV}.zip" || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLIBS_BUNDLE="${WORKDIR}/libs_bundle"
		-DCMAKE_INSTALL_SYSCONFDIR=/etc
		-DCMAKE_INSTALL_LOCALSTATEDIR=/var
		-DCMAKE_INSTALL_RUNSTATEDIR=/run
		-DBUILD_SHARED_LIBS=OFF
		-DWITH_RE2_FORCE_STATIC=OFF
		-DWITH_STEMMER_FORCE_STATIC=OFF
		-DWITH_ICU_FORCE_STATIC=OFF
		-DWITH_GALERA=OFF
		-DWITH_JIEBA=OFF
		-DWITH_SSL=$(usex ssl)
		-DWITH_ZLIB=$(usex zlib)
		-DWITH_ZSTD=$(usex zstd)
		-DWITH_CURL=$(usex curl)
		-DWITH_EXPAT=$(usex expat)
		-DWITH_MYSQL=$(usex mysql)
		-DWITH_POSTGRESQL=$(usex postgres)
		-DWITH_ODBC=$(usex odbc)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	# cmake installs empty dirs; mark them so portage keeps them (EAPI 8 strips empty dirs)
	keepdir /var/lib/manticore
	keepdir /var/log/manticore
	# /run/manticore is a tmpfs-backed runtime dir; create it via init script at runtime
	rm -rf "${ED}/run" || die
}
