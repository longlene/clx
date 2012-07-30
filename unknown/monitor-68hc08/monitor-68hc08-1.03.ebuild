# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/usbirboy/usbirboy-0.2.1-r1.ebuild,v 1.9 2006/09/24 09:20:38 hansmi Exp $

inherit eutils

DESCRIPTION="Software to upload firmware programs to Motorolla 68HC08
microcontroller familly"
HOMEPAGE="http://sourceforge.net/projects/monitor-68hc08/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

DEPEND="sys-libs/ncurses
sys-libs/glibc"
RDEPEND=""

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dodoc README
	exeinto /usr/bin
	doexe ${T}/../work/${PN}/monitor-68HC08
}

