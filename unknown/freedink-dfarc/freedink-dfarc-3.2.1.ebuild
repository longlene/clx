# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="frontend and .dmod installer for GNU FreeDink"
MY_PN="dfarc"
MY_P="${MY_PN}-${PV}"
HOMEPAGE="http://www.freedink.org/"
#SRC_URI="http://ftp.gnu.org/gnu/freedink/${MY_P}.tar.bz2
#		 mirror://gnu/freedink/${P}.tar.bz2"
SRC_URI="http://www.freedink.org/snapshots/${MY_P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~x86"

DEPEND="
	>=x11-libs/wxGTK-2.6
	>=app-arch/bzip2-1.0
	>=dev-util/intltool-0.31
	x11-misc/xdg-utils
"
RDEPEND="
	>=x11-libs/wxGTK-2.6
	>=app-arch/bzip2-1.0
	x11-misc/xdg-utils
"

S="${WORKDIR}/${MY_P}"

src_compile() {
	egamesconf || die
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS NEWS README THANKS TODO TRANSLATIONS.txt
	prepgamesdirs
}

