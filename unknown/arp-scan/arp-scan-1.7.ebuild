# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit multilib

DESCRIPTION="arp-scan is a command-line tool for system discovery and fingerprinting. It constructs and sends ARP requests to the specified IP addresses, and displays any responses that are received."
HOMEPAGE="http://www.nta-monitor.com/tools/arp-scan/index.html"
SRC_URI="http://www.nta-monitor.com/tools/arp-scan/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""
DEPEND=">=net-libs/libpcap-0.8"

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog README TODO
}
