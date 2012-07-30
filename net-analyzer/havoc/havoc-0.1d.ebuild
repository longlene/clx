# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Random ARP traffic generator, BOFH style."
HOMEPAGE="http://www.0xdeadbeef.info/"
SRC_URI="http://www.0xdeadbeef.info/code/havoc-0.1d.tgz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86"
IUSE=""

DEPEND=">=net-libs/libpcap-0.9.4"
S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A} ; cd ${S}
}

src_compile() {
	./configure --prefix=/usr	
	make CFLAGS="${CFLAGS}" || die
}

src_install() {
	dosbin havoc
}
