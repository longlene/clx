# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils qt4-r2

DESCRIPTION="Video capture and playback software application compatible with all Blackmagic Design DeckLink, Multibridge and Intensity products."
HOMEPAGE="http://www.blackmagic-design.com"
SRC_URI="http://www.blackmagic-design.com/downloads/software/DeckLink_Linux_7.5.2.tar.gz"

IUSE=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

COMMON_DEPEND="media-video/DeckLink"
DEPEND="${COMMON_DEPEND}
	app-arch/rpm2targz"
RDEPEND="${COMMON_DEPEND}"

if use x86; then
	MY_P="${PN}-${PV/_/}-redhat.i386"
elif use amd64; then
	MY_P="${PN}-${PV/_/}-redhat.x86_64"
fi

S="${WORKDIR}"

src_unpack() {
	unpack ${A}

	rpm2tar -O ${MY_P}.rpm | tar xfp - || die
}

src_install() {
	cd ${S} || die
	dobin usr/bin/*

	dodir /usr/share/applications
	doins usr/share/applications/*

	insinto /usr/share/icons/hicolor
	cp -r usr/share/icons/hicolor/* ${D}/usr/share/icons/hicolor || die
	dosym /usr/share/icons/hicolor/48x48/apps/MediaExpress.png \
		/usr/share/pixmaps/
}
