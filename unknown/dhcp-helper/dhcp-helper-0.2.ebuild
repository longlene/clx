# Copyright 1999-2005 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License, v2 or later
# $Header:$

inherit eutils

DESCRIPTION="DHCP relay agent alternative to the ISC relay."
HOMEPAGE="http://thekelleys.org.uk/dhcp-helper"
SRC_URI="http://thekelleys.org.uk/dhcp-helper/dhcp-helper-0.2.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

src_compile() {
	emake || die
}

src_install () {
	dosbin dhcp-helper
	doman dhcp-helper.8
	dodoc CHANGELOG COPYING README

	newinitd ${FILESDIR}/dhcp-helper.rc dhcp-helper
	newconfd ${FILESDIR}/dhcp-helper.confd dhcp-helper
			
}
