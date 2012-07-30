# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A neat and simple webcam app"
HOMEPAGE="http://www.firestorm.cx/fswebcam/"
SRC_URI="http://www.firestorm.cx/fswebcam/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="png jpeg truetype +v4l +v4l2"

EAPI="2"

DEPEND=">=media-libs/gd-2[png?,jpeg?,truetype?]
	v4l? ( sys-kernel/linux-headers )
        v4l2? ( sys-kernel/linux-headers )"

src_configure() {
	local myconf
        use v4l  || myconf="${myconf} --disable-v4l1"
        use v4l2 || myconf="${myconf} --disable-v4l2"
        econf ${myconf}
}

src_install() {
	dobin fswebcam || die
	dodoc README CHANGELOG LICENSE example.conf || die
	doman fswebcam.1.gz
}
