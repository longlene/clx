# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="This is an interpreter for the rule-based programming language ELAN."
HOMEPAGE="http://elan.loria.fr/"
SRC_URI="http://elan.loria.fr/Soft/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RDEPEND="virtual/libc
         sys-devel/gcc"
DEPEND="${RDEPEND}
        sys-devel/bison
        sys-devel/flex"
S=${WORKDIR}/${P}

src_compile() {
	econf || die "econf failed"
	emake -j1 || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die
}
