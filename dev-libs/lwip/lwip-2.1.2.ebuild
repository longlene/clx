# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic

DESCRIPTION="A Lightweight TCP/IP stack"
HOMEPAGE="http://www.nongnu.org/lwip"
SRC_URI="http://download.savannah.nongnu.org/releases/lwip/${P}.zip
	http://download.savannah.gnu.org/releases/lwip/contrib-2.0.1.zip -> ${PN}-contrib-2.0.1.zip"


LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

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
