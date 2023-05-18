# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Lua implementation of ACMEv2 procotol"
HOMEPAGE="https://github.com/fffonion/lua-resty-acme"
SRC_URI="https://github.com/fffonion/lua-resty-acme/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lua-resty-http
	dev-lua/lua-resty-lrucache
	dev-lua/lua-resty-openssl
"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
