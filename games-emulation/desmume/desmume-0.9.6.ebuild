# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/desmume/desmume-0.9.5.ebuild,v 1.3 2010/03/04 00:43:55 nyhm Exp $

EAPI="2"

inherit eutils games

_MYRELEASE="1"

DESCRIPTION="Nintendo DS emulator"
HOMEPAGE="http://desmume.org/"
SRC_URI="mirror://sourceforge/desmume/${P}-${_MYRELEASE}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="agg glade gtk"

DEPEND="virtual/opengl
	sys-libs/zlib
	dev-libs/zziplib
	media-libs/libsdl[joystick]
	agg? ( x11-libs/agg )
	gtk? ( >=x11-libs/gtk+-2.8.0
		x11-libs/gtkglext )
	glade? ( gnome-base/libglade
		dev-util/intltool
		sys-devel/gettext
		x11-libs/gtkglext )
"
RDEPEND="${DEPEND}"

src_configure() {
	egamesconf --datadir=/usr/share || die "egamesconf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
	if ! use gtk; then
		[ -f "${D}/${GAMES_BINDIR}/desmume" ] && rm "${D}/${GAMES_BINDIR}/desmume"
	fi
	if ! use glade; then
		[ -f "${D}/${GAMES_BINDIR}/desmume-glade" ] && rm "${D}/${GAMES_BINDIR}/desmume-glade"
	fi
	dodoc AUTHORS ChangeLog README README.LIN
	prepgamesdirs
}
