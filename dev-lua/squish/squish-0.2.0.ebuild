# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua

DESCRIPTION="A tool to pack many individual Lua scripts and their modules into a single Lua script"
HOMEPAGE="http://matthewwild.co.uk/projects/squish/home"
SRC_URI="http://matthewwild.co.uk/projects/squish/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin squish
	dodoc README
}
