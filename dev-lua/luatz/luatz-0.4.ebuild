# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A lua library for time and date manipulation"
HOMEPAGE="https://github.com/daurnimator/luatz"
SRC_URI="https://github.com/daurnimator/luatz/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r luatz
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
