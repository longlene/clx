# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="GUI MD5 summer (or md2, md4, sha1, sha, ripemd160, dss1)"
HOMEPAGE="http://asgaard.homelinux.org/code/ghasher/"
SRC_URI="http://asgaard.homelinux.org/code/ghasher/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.4
	=dev-util/glade-2*
	dev-libs/openssl
	dev-util/pkgconfig"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd ${WORKDIR}/${P}
	sed -i "s:/usr/:${D}/usr/:g" Makefile
}

src_install() {
	dodir -p /usr/bin
	make DESTDIR=${D} install
}
