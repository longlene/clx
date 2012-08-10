# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs eutils

DESCRIPTION="Take a photo from webcam on your shell"
HOMEPAGE="http://staticwave.ca/source/uvccapture/"
SRC_URI="http://staticwave.ca/source/${PN}/${P}.tar.bz2"

KEYWORDS="amd64 x86"
IUSE=""
LICENSE="GPL-2"
SLOT="0"

DEPEND="virtual/jpeg"
RDEPEND=""

src_prepare () {
	sed -i "s:videodev.h:videodev2.h:" uvccapture.c v4l2uvc.c || die
	epatch "${FILESDIR}/Makefile.patch"
}

src_compile () {
	emake \
		CC="$(tc-getCC)" \
		LDFLAGS="${LDFLAGS}"
}

src_install () {
	dobin ${PN}
}
