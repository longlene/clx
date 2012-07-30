# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/desmume/desmume-0.9.5.ebuild,v 1.3 2010/03/04 00:43:55 nyhm Exp $

EAPI="2"

inherit eutils games

MY_P="${P/_p/-}"
DESCRIPTION="Nintendo DS emulator"
HOMEPAGE="http://desmume.org/"
SRC_URI="mirror://sourceforge/desmume/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="openal gtk glade osmesa nls wifi wxwidgets"

DEPEND="virtual/opengl
	sys-libs/zlib
	dev-libs/zziplib
	media-libs/libsdl[joystick]
	x11-libs/agg
	nls? ( virtual/libintl
		sys-devel/gettext )
	openal? ( media-libs/openal )
	gtk? ( >=x11-libs/gtk+-2.8.0
		x11-libs/gtkglext )
	glade? ( gnome-base/libglade
		x11-libs/gtkglext )
	osmesa? ( media-libs/mesa[osmesa] )
	wifi? ( net-libs/libpcap )
	wxwidgets? ( x11-libs/wxGTK )"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${P/_p?/}"

src_prepare() {
	use wxwidgets && \
		ewarn "wxwidgets support is broken and may not build"
	use wifi && \
		eerror "wifi support and configuration is broken and disabled for now"
	
	if ! use gtk && $(use glade || use wxwidgets); then
		einfo "glade or wxwidgets support was requested but not gtk"
		einfo "both glade(libglade) and wxwidgets(wxGTK) depend on gtk"
		einfo "it may be usefull to enable gtk support after all"
	fi
}

src_configure() {
	egamesconf --datadir=/usr/share \
		$(use_enable openal) \
		$(use_enable osmesa) \
		$(use_enable nls) \
		$(use_enable wxwidgets) \
		|| die "egamesconf failed"
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
