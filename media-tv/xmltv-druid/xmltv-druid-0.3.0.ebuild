# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Very simple Gnome druid for selecting, configuring and scheduling s tv_grab task for XMLTV."
HOMEPAGE="http://gshowtv.sourceforge.net/xmltv-druid.html"
SRC_URI="mirror://sourceforge/gshowtv/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-tv/xmltv
	dev-perl/gtk2-perl
	dev-perl/gtk2-gladexml
	dev-perl/gnome2-perl
	gnome-base/libgnomeui"
RDEPEND="${DEPEND}"

src_compile() {
	emake build || die "emake build failed."
}

src_install() {
	dodoc AUTHORS README
	dobin xmltv-druid
	doman xmltv-druid.1
	domenu xmltv-druid.desktop
}
