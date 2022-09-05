# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="b3b32c060c4269c25d11cf9f983c291d9448e1ee"

DESCRIPTION="A powerful argument checker and function overloading system for Lua or LuaJIT"
HOMEPAGE="https://github.com/torch/argcheck"
SRC_URI="https://github.com/torch/argcheck/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="${LUA_DEPS}"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( README.md )

lua_src_install() {
	insinto $(lua_get_lmod_dir)/argcheck
	doins {init,env,utils,doc,dump}.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
