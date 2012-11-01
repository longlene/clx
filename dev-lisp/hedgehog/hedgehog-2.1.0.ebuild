# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/hedgehog/hedgehog-2.1.0.ebuild,v 1.2 2009/09/23 17:16:51 patrick Exp $

inherit eutils

DESCRIPTION="Hedgehog is a very concise implementation of a Lisp-like language for low-end and embedded devices."
SRC_URI="http://hedgehog.oliotalo.fi/download/${P}.tar.gz"
HOMEPAGE="http://hedgehog.oliotalo.fi/"
SLOT="0"
LICENSE="LGPL-2.1 BSD"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

S=${WORKDIR}/${PN}-${PV:0:3}

# Documentation can't be built until weblint-perl and html2ps are added to
# portage.

src_unpack() {
	unpack ${A}
	pushd ${S}
	cp configure configure.template \
		&& sed "s,CFLAGS=',CFLAGS='$CFLAGS ,g" \
		< configure.template \
		> configure || die
}

src_compile() {
	mkdir build
	cd build
	../configure linux /usr || die
	make || die
}

src_install () {
	make -C build install prefix=${D}/usr
	dodoc LICENSE* README TODO
}
