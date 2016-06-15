# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit flag-o-matic

DESCRIPTION="A Lightweight TCP/IP stack"
HOMEPAGE="http://www.nongnu.org/lwip"
SRC_URI="http://download.savannah.gnu.org/releases/lwip/${P}.zip
http://download.savannah.gnu.org/releases/lwip/contrib-${PV}.zip -> ${PN}-contrib-${PV}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	#sed -i -e 's/include .depend//' -e "/LWIPDIR=/{s/lwip/${P}/}" "${WORKDIR}"/contrib-${PV}/ports/unix/proj/lib/Makefile
	sed -i -e "/LWIPDIR=/{s/lwip/${P}/}" -e '/CFLAGS=/{s/$/ -fPIC/}' "${WORKDIR}"/contrib-${PV}/ports/unix/proj/lib/Makefile
}

src_compile() {
	append-flags "-fPIC"
	emake -C "${WORKDIR}"/contrib-${PV}/ports/unix/proj/lib
}

src_install() {
	insinto /usr/include
	doins -r src/include/{ipv4,ipv6,posix,lwip,netif}
	dolib.so "${WORKDIR}"/contrib-${PV}/ports/unix/proj/lib/lib${PN}.so
	dodoc README
}
