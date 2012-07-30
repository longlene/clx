# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=2
inherit eutils games

DESCRIPTION="Free Awale - The game of all Africa"
HOMEPAGE="http://www.nongnu.org/awale/"
SRC_URI="http://download.savannah.gnu.org/releases/awale/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lang/tcl
	dev-lang/tk"
DEPEND="${RDEPEND}"


#src_configure() {
#	egamesconf \
#		--disable-dependency-tracking \
#		--disable-static \
#		--program-prefix=ace-
#}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README THANKS
	exeinto ${GAMES_DATADIR}/${PN}
	doexe src/xawale.tcl
	newicon src/awale.png ${PN}.png
	make_desktop_entry xawale xawale /usr/share/pixmaps/${PN}.png
	prepgamesdirs
}
