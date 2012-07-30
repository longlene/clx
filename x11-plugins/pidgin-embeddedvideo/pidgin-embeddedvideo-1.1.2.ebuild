# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_P="${PN}-${PV//.2/-2}"
DESCRIPTION="Pidgin plugin for sharing and viewing links to videos"
HOMEPAGE="http://code.google.com/p/pidgin-embeddedvideo/"
SRC_URI="http://pidgin-embeddedvideo.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-im/pidgin[gtk]
	>=net-libs/webkit-gtk-1.1.12
	net-misc/curl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_compile() {
	emake -j1 || die "make failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "install fail"
	dodoc AUTHORS ChangeLog || die "doc install fail"
}


