# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

IUSE=""

DESCRIPTION="Gimp CMYK plug-in."
HOMEPAGE="http://cue.yellowmagic.info/softwares/separate.html"
SRC_URI="http://registry.gimp.org/files/separate+-${PV}.zip
	 http://download.adobe.com/pub/adobe/iccprofiles/win/AdobeICCProfilesCS4Win_end-user.zip"

LICENSE="GPL-2 Adobe"
SLOT="0"
KEYWORDS="~x86"

DEPEND="media-libs/lcms
	media-libs/tiff
	>=media-gfx/gimp-2"

S="${WORKDIR}/separate+-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/installer.patch"
}

src_install() {
	emake PREFIX="${D}/usr" install
	dodir /usr/share/color/icc
	insinto /usr/share/color/icc
	cd "${S}"
	doins -r sRGB
	cd "${WORKDIR}/Adobe ICC Profiles (end-user)"
	doins -r CMYK
	doins -r RGB
}

