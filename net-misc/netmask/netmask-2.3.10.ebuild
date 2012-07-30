# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/ipcalc/ipcalc-0.41.ebuild,v 1.11 2008/02/03 16:30:42 grobian Exp $

DESCRIPTION="calculates netmask masks and subnet ranges"
HOMEPAGE="http://packages.debian.org/sid/netmask"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/n/netmask/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~s390 ~sparc ~x86 ~x86-fbsd"
IUSE=""

src_compile() {
	econf || die "Error: configure failed"
	emake || die "Error: make failed"
}

src_install () {
	dobin netmask
	dodoc AUTHORS ChangeLog COPYING README
	doman netmask.1
	doinfo netmask.info
}
