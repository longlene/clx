# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

EGIT_COMMIT="d101b51e0060fae9fb9f0815c6eb6a156a0a36ce"

DESCRIPTION="Lightweight, broker-less, messaging and scalability protocols for Lua"
HOMEPAGE="https://cogarr.net/source/cgit.cgi/lua-nng/"
SRC_URI="https://cogarr.net/source/cgit.cgi/lua-nng/snapshot/lua-nng-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/nng
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}


lua_src_compile() {
	emake \
		CFLAGS="-fPIC $(lua_get_CFLAGS)" \
		LDFLAGS="-shared $(lua_get_LIBS)" \
		LIB_EXTENSION="so"
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins bin/nng.so
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
