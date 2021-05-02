# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

WX_GTK_VER="2.8"
inherit games wxwidgets

DESCRIPTION="The first computer video game as created at MIT for the DEC PDP-1"
HOMEPAGE="http://sourceforge.net/projects/pdp1spacewar/"
SRC_URI="http://downloads.sourceforge.net/project/pdp1spacewar/spacewar.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/wxGTK:2.8[X]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	emake prefix="${D}${GAMES_PREFIX}" install || die "Install failed"
}
