# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

EGIT_COMMIT="f1a57f25bf8554bf430faba5237dec7f04b2979a"

DESCRIPTION="A high-performance functional programming library for LuaJIT"
HOMEPAGE="https://github.com/luafun/luafun"
SRC_URI="https://github.com/luafun/luafun/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/luafun-${EGIT_COMMIT}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins fun.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
