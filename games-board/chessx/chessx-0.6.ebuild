# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-board/scid/scid-3.6.24.ebuild,v 1.2 2008/07/04 15:14:47 mr_bones_ Exp $

EAPI="2"

inherit base eutils games qt4-r2 toolchain-funcs

DESCRIPTION="a Qt4 chess database application"
HOMEPAGE="http://chessx.sourceforge.net/"
SRC_URI="mirror://sourceforge/chessx/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/qt-core-4.2
		>=x11-libs/qt-gui-4.2
		>=x11-libs/qt-xmlpatterns-4.2"

src_configure(){
	eqmake4 chessx.pro
}

src_compile() {


	emake || die "emake failed"
}

src_install() {
	dodoc ChangeLog TODO
	dogamesbin bin/${PN} || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r data/* || die
	doins -r i18n/* || die
	doicon "${S}"/data/images/chessx_16.tiff 
	make_desktop_entry chessx chessx chessx_16.tiff "Game;BoardGame"
	domenu "${FILEDIR}"/chessx-chessx.desktop
	prepgamesdirs
}

