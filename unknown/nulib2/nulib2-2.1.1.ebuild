# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="utility & library for manipulating NuFX archives"
HOMEPAGE="http://www.nulib.com/"
SRC_URI="mirror://sourceforge/nulib2/nulibdist-211.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_unpack() {
	unpack ${A}
}

src_compile() {
	cd ${WORKDIR}/nufxlib-211
	econf || die "./configure failed"
	make depend || die "make depend failed"
	make -j1 || die "emake failed"
	cd ${WORKDIR}/nulib2-211
	econf || die "./configure failed"
	make depend || die "make depend failed"
	make -j1 || die "emake failed"
}

src_install() {
	cd ${WORKDIR}/nufxlib-211
        einstall libdir="${D}"/usr/$(get_libdir) || die
	cd ${WORKDIR}/nulib2-211
        einstall || die
}
