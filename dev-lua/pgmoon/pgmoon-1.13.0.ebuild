# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A pure Lua Postgres driver for use in OpenResty & more"
HOMEPAGE="https://github.com/leafo/pgmoon"
SRC_URI="https://github.com/leafo/pgmoon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"

DOCS=( README.md )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r pgmoon
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
