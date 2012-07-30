# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/stalonetray/stalonetray-0.7.6.ebuild,v 1.2 2009/09/09 20:36:43 maekke Exp $

EAPI="3" 

inherit eutils

DESCRIPTION="System tray utility including support for KDE system tray icons"
HOMEPAGE="http://stalonetray.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug kde"

RDEPEND="x11-libs/libX11
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xproto"

src_prepare() {
	epatch "${FILESDIR}/${P}-debug.patch"
	epatch "${FILESDIR}/${P}-kde.patch"
}


src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable kde native-kde) \
		|| die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc AUTHORS ChangeLog NEWS README stalonetrayrc.sample TODO
	dohtml stalonetray.html
}
