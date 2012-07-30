# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Ubench provides a single measure of perfomance for machines running various flavors of Unix operating system."
HOMEPAGE="http://www.phystech.com/"
SRC_URI="http://www.phystech.com/ftp/ubench-0.32.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/ubench-${PV}"

src_unpack() {
	unpack ${A} || die
	cd ${S} || die
	
	sed -i -e "s/\/usr\/local\/bin/..\/..\/image\/usr\/local\/bin/g" \
	-i -e "s/^CFLAGS.*/CFLAGS = ${CFLAGS}/" \
	configure || die "sed failed"
}

src_compile() {
	./configure || die "configure error"
	emake || die "problem compiling ubench"
}

src_install () {
	mkdir -p ../../image/usr/local/bin
	make install || die "problem installing ubench"
}
