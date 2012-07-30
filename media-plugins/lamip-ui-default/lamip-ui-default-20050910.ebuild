# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="LAMIP is a modularized audio player. This is the default control plugin"
HOMEPAGE="http://fondriest.frederic.free.fr/realisations/lamip/"
LICENSE="GPL-2"

SRC_URI="http://fondriest.frederic.free.fr/realisations/lamip/files/src/0.0.3/lamip-controlDEFAULT_${PV}.tar.bz2"
RESTRICT="nomirror" #as long as it isn't in the official Portage tree

SLOT="0"
KEYWORDS="~x86"
IUSE="debug shoutcast"

DEPEND="media-sound/lamip-core
	>=x11-libs/gtk+-2"

S="${WORKDIR}/controldefault"

src_compile() {
	autoreconf -vifs || die "error: autoreconf failed!"
	econf \
	$(use_enable debug) \
	$(use_enable shoutcast) \
	|| die "error: econf failed!"
}

src_install() {
	make install DESTDIR="${D}" || die "error: install failed!"
	dodoc AUTHORS ChangeLog NEWS README
}
