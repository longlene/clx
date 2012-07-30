# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="This is Pluggable Authentication Module for Face based Authentication"
HOMEPAGE="http://code.google.com/p/pam-face-authentication/"
SRC_URI="http://pam-face-authentication.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=sys-libs/pam-0.99.8
        >=media-libs/opencv-1.0.0
        >=sci-libs/gsl-1.9"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc README NEWS AUTHORS || die
}

