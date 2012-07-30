# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Drum synth, 100% sample free"
HOMEPAGE="http://smack.berlios.de/"
SRC_URI="http://download.berlios.de/smack/${P}.tar.gz"

IUSE=""
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"

DEPEND=">=media-sound/om-0.2.0
	>=media-plugins/omins-0.2.0
	media-plugins/swh-plugins
	media-plugins/blop
	media-libs/ladspa-sdk
	media-libs/ladspa-cmt"

src_install() {
	emake DESTDIR=${D} install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS THANKS README
}
