# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit autotools eutils toolchain-funcs

DESCRIPTION="Library to work with P2K mobile phones"
HOMEPAGE="http://sourceforge.net/projects/moto4lin/"
SRC_URI="http://intgat.tigress.co.uk/rmy/p2kfuse/p2kmoto-SVN-20080404.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S="$WORKDIR/$PN"

DEPEND="dev-libs/libusb:0"
RDEPEND="$DEPEND"

src_prepare() {
	eautoreconf
}

src_install() {
	dolib src/.libs/libp2kmoto.a
	dolib src/libp2kmoto.la
	dolib src/.libs/libp2kmoto.so
	dolib src/.libs/libp2kmoto.so.0
	dolib src/.libs/libp2kmoto.so.0.0.0
	insinto /usr/include/
	doins src/p2kmoto.h
}

