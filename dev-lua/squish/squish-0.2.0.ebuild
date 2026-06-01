# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A tool to pack many individual Lua scripts and their modules into a single"
HOMEPAGE="http://matthewwild.co.uk/projects/squish/home"
SRC_URI="http://matthewwild.co.uk/projects/squish/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

src_install() {
	dobin squish
	dodoc README
}
