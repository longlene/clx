# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A Linux utility to change the base clock (FSB/Front Side Bus) \
frequency without having to restart the machine."
HOMEPAGE="http://sourceforge.net/projects/lfsb"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_unpack() {
	unpack $A
	cd "${S}"

	sed -i 's#-O2 -g0 -s -std=c99 -Wall -fpedantic -finline -march=i586#-g0 -s -std=c99 -finline ${GENTOO_CFLAGS}#' Makefile
}

src_compile() {
	make GENTOO_CFLAGS="${CFLAGS}" || die "make failed."
}

src_install() { 
	into /usr
	dobin lfsb
	dodoc AUTHORS ChangeLog NEWS README TODO 
}
