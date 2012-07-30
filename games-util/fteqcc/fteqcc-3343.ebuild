# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="QC compiler"
HOMEPAGE="http://fteqw.sourceforge.net/"
SRC_URI="mirror://sourceforge/fteqw/ftesrc${PV}-all.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"

DEPEND="sys-libs/glibc"
RDEPEND=""

S=${WORKDIR}/qclib

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-cleanup-source.patch
	sed -i \
		-e "s: -O3 : :g" \
		-e "s: -s : :g" \
		Makefile || die "sed failed"
	edos2unix readme.txt
}

src_compile() {
	emake BASE_CFLAGS="${CFLAGS} -Wall -DQCCONLY" || die "emake qcc failed"
}

src_install() {
	newbin fteqcc.bin fteqcc || die "newbin fteqcc.bin failed"
	dodoc readme.txt
}
