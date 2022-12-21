# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="The API Gateway & Microservice Management Layer"
HOMEPAGE="https://konghq.com/install"
SRC_URI="https://github.com/Kong/kong/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/inspect[${LUA_USEDEP}]
	dev-lua/luasec[${LUA_USEDEP}]
	dev-lua/luasocket[${LUA_USEDEP}]
	dev-lua/penlight[${LUA_USEDEP}]
	dev-lua/lua-resty-http[${LUA_USEDEP}]
	dev-lua/lua-resty-jit-uuid[${LUA_USEDEP}]
	dev-lua/lua-ffi-zlib[${LUA_USEDEP}]
	dev-lua/multipart[${LUA_USEDEP}]
	dev-lua/version[${LUA_USEDEP}]
	dev-lua/kong-lapis[${LUA_USEDEP}]
	dev-lua/lua-cassandra[${LUA_USEDEP}]
	dev-lua/pgmoon[${LUA_USEDEP}]
	dev-lua/luatz[${LUA_USEDEP}]
	dev-lua/lua-system-constants[${LUA_USEDEP}]
	dev-lua/lyaml[${LUA_USEDEP}]
	dev-lua/luasyslog[${LUA_USEDEP}]
	dev-lua/lua-pack[${LUA_USEDEP}]
	dev-lua/binaryheap[${LUA_USEDEP}]
	dev-lua/luaxxhash[${LUA_USEDEP}]
	dev-lua/lua-protobuf[${LUA_USEDEP}]
	dev-lua/lua-resty-worker-events[${LUA_USEDEP}]
	dev-lua/lua-resty-healthcheck[${LUA_USEDEP}]
	dev-lua/lua-resty-mlcache[${LUA_USEDEP}]
	dev-lua/messagepack[${LUA_USEDEP}]
	dev-lua/lua-resty-openssl[${LUA_USEDEP}]
	dev-lua/lua-resty-counter[${LUA_USEDEP}]
	dev-lua/lua-resty-ipmatcher[${LUA_USEDEP}]
	dev-lua/lua-resty-acme[${LUA_USEDEP}]
	dev-lua/lua-resty-session[${LUA_USEDEP}]
	dev-lua/lua-resty-timer-ng[${LUA_USEDEP}]
"
src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r kong
}

src_install() {
	lua_foreach_impl lua_src_install
	dobin bin/kong
	dodoc README.md
}
