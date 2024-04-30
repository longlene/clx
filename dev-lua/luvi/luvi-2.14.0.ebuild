# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit cmake flag-o-matic lua-single unpacker

LUA_COMPAT_PV="0.10"
LUA_OPENSSL_COMMIT="c425885bd344481c51aebcc189aba49df42f072f"
LUA_AUXILIAR_COMMIT="8d09895473b73e4fb72b7573615f69c36e1860a2"
LREXLIB_COMMIT="69d5c442c5a4bdc1271103e88c5c798b605e9ed2"
LPEG_COMMIT="fda374f3bbac50653bdeba7404d63e13972e6210"
LUA_ZLIB_COMMIT="a305d98f473d0a253b6fd740ce60d7d5a5f1cda0"

DESCRIPTION="A project in-between luv and luvit"
HOMEPAGE="https://github.com/luvit/luvi"
SRC_URI="
	https://github.com/luvit/luvi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/keplerproject/lua-compat-5.3/archive/v${LUA_COMPAT_PV}.tar.gz -> ${PN}-lua-compat-${LUA_COMPAT_PV}.tar.gz
	ssl? (
		https://github.com/zhaozg/lua-openssl/archive/${LUA_OPENSSL_COMMIT}.tar.gz -> lua-openssl-${LUA_OPENSSL_COMMIT}.tar.gz
		https://github.com/zhaozg/lua-auxiliar/archive/${LUA_AUXILIAR_COMMIT}.tar.gz -> lua-auxiliar-${LUA_AUXILIAR_COMMIT}.tar.gz
	)
	pcre? ( https://github.com/rrthomas/lrexlib/archive/${LREXLIB_COMMIT}.tar.gz -> lrexlib-${LREXLIB_COMMIT}.tar.gz )
	lpeg? ( https://github.com/luvit/lpeg/archive/${LPEG_COMMIT}.tar.gz -> lpeg-${LPEG_COMMIT}.tar.gz )
	zlib? ( https://github.com/brimworks/lua-zlib/archive/${LUA_ZLIB_COMMIT}.tar.gz -> lua-zlib-${LUA_ZLIB_COMMIT}.tar.gz )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
# FIXME lpeg
IUSE="ssl pcre lpeg zlib"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="
	${LUA_DEPS}
	dev-lua/luv
	ssl? ( dev-lua/lua-openssl )
	pcre? ( dev-libs/libpcre )
	zlib? ( sys-libs/zlib )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	${FILESDIR}/luvi-2.14.0-cmake.patch
)

src_prepare() {
	sed -e "/SET(CMAKE_INSTALL_RPATH/{s#/lib#/$(get_libdir)#}" \
		-i CMakeLists.txt || die "failed to fix libdir"
	if use ssl; then
		rmdir deps/lua-openssl && ln -sv "${WORKDIR}"/lua-openssl-${LUA_OPENSSL_COMMIT} deps/lua-openssl

		rmdir deps/lua-openssl/deps/auxiliar && ln -sv "${WORKDIR}"/lua-auxiliar-${LUA_AUXILIAR_COMMIT} deps/lua-openssl/deps/auxiliar
		rmdir deps/lua-openssl/deps/lua-compat && ln -sv "${WORKDIR}"/lua-compat-5.3-${LUA_COMPAT_PV} deps/lua-openssl/deps/lua-compat
	fi
	use pcre && rmdir deps/lrexlib && ln -sv "${WORKDIR}"/lrexlib-${LREXLIB_COMMIT} deps/lrexlib
	use lpeg && rmdir deps/lpeg && ln -sv "${WORKDIR}"/lpeg-${LPEG_COMMIT} deps/lpeg
	use zlib && rmdir deps/lua-zlib && ln -sv "${WORKDIR}"/lua-zlib-${LUA_ZLIB_COMMIT} deps/lua-zlib
	echo "${PV}" > VERSION
	cmake_src_prepare
}

src_configure() {
	local lua_compat_dir="${WORKDIR}/lua-compat-5.3-${LUA_COMPAT_PV}"
	local LPEGLIB_DIR="${WORKDIR}/lpeg-${LPEG_COMMIT}"
	local mycmakeargs=(
		-DWithSharedLibluv=ON
		-DWITH_LUA_ENGINE=LuaJIT
		-DLUA_COMPAT53_DIR="${lua_compat_dir}"
		-DWithOpenSSL=$(usex ssl)
		-DWithSharedOpenSSL=$(usex ssl)
		-DWithPCRE=$(usex pcre)
		-DWithSharedPCRE=$(usex pcre)
		-DWithLPEG=$(usex lpeg)
		-DWithSharedLPEG=$(usex lpeg)
		-DWithZLIB=$(usex zlib)
		-DWithSharedZLIB=$(usex zlib)
	)
	cmake_src_configure
}

src_test() {
	${BUILD_DIR}/luvi samples/test.app
}
