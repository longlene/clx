# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=3

inherit eutils

DESCRIPTION="Play and record audio streams from a DVB-S/-T/-C adapter with Audacious"
HOMEPAGE="http://audacious-dvb.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="static-libs"

RDEPEND=">=media-sound/audacious-1.5
	>=x11-libs/gtk+-2.14
	gnome-base/libglade
	media-libs/libmad"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0"

src_configure() {
	econf \
		$(use_enable static-libs static) || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog COPYING NEWS README TODO
}
