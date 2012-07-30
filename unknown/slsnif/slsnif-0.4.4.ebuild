# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/boxes/boxes-1.0.1.ebuild,v 1.24 2005/04/21 19:03:36 blubb Exp $

inherit eutils

DESCRIPTION="Sniffer for serial ports"
HOMEPAGE="http://sourceforge.net/projects/slsnif/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ppc sparc mips alpha amd64 ppc64"
IUSE=""

DEPEND="virtual/libc"

src_install() {
	dobin src/slsnif || die
	doman slsnif.1
	dodoc README*
	dodoc slsnifrc-example
}
