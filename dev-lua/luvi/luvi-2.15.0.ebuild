# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit cmake flag-o-matic lua-single unpacker

LUA_COMPAT_PV="0.10"
LUA_OPENSSL_COMMIT="5bc07789cbe473bc86dda1957a168fb209077c38"
LUA_AUXILIAR_COMMIT="8d09895473b73e4fb72b7573615f69c36e1860a2"
LREXLIB_COMMIT="9aa5e7e9ca47da1bd0e023dfa0b1b2d43aa358f3"
LPEG_COMMIT="55bbd00e53890e50e05018907140f4f3d3e234f4"
LUA_ZLIB_COMMIT="15d4bc84b0ad3e4012d72ce18cfae58518ec13b4"
MINIZ_COMMIT="bf7a1f0a5aa1deae9cab2d73b5ef9edec41b877c"

DESCRIPTION="A project in-between luv and luvit"
HOMEPAGE="https://github.com/luvit/luvi"
SRC_URI="
	https://github.com/luvit/luvi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/keplerproject/lua-compat-5.3/archive/v${LUA_COMPAT_PV}.tar.gz -> ${PN}-lua-compat-${LUA_COMPAT_PV}.tar.gz
	https://github.com/richgel999/miniz/archive/${MINIZ_COMMIT}.tar.gz -> miniz-${MINIZ_COMMIT}.tar.gz
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
IUSE="-ssl pcre lpeg zlib"

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
	${FILESDIR}/${P}-cmake.patch
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
	rmdir deps/miniz && ln -sv "${WORKDIR}"/miniz-${MINIZ_COMMIT} deps/miniz
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
