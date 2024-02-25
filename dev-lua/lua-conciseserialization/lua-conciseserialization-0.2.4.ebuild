# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A pure Lua implementation of CBOR / RFC8949"
HOMEPAGE="https://framagit.org/fperrad/lua-ConciseSerialization"
SRC_URI="https://framagit.org/fperrad/lua-ConciseSerialization/-/archive/${PV}/lua-ConciseSerialization-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND=""





S="${WORKDIR}"/lua-ConciseSerialization-${PV}

src_compile() { :; }

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins src/CBOR.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
