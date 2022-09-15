# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua cmake

DESCRIPTION="Lua nanoid library for the ngx_lua"
HOMEPAGE="https://github.com/aikin-vip/lua-resty-nanoid"
SRC_URI="https://github.com/aikin-vip/lua-resty-nanoid/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	${LUA_DEPS}
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/find_package/{/Lua51/d}' \
		-i CMake/lua.cmake
	lua_foreach_impl cmake_src_prepare
}

each_src_configure() {
	local mycmakeargs=(
		-DLUA_INCLUDE_DIR=$(lua_get_include_dir)
		-DLUA_LIBRARY=$(lua_get_LIBS)
	)
	cmake_src_configure
}

src_configure() {
	lua_foreach_impl each_src_configure
}

src_compile() {
	lua_foreach_impl cmake_src_compile
}

each_src_install() {
	insinto "$(lua_get_cmod_dir)"
	doins "${BUILD_DIR}"/nanoid.so
}

src_install() {
	lua_foreach_impl each_src_install
	einstalldocs
}
