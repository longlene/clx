# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod

DESCRIPTION="Linux driver for the ArrayComm(TM) \"iBurst(TM)\" wireless broadband devices."

SRC_URI="mirror://sourceforge/ibdriver/${P}.tar.gz"
LICENSE="GPL-2"

KEYWORDS="~x86"
IUSE="pcmcia"

BUILD_TARGETS="default"
MODULE_NAMES="ib-file(net:)
			ib-net(net:)
			ib-pcmcia(net:)
			ib-usb(net:)"

pkg_setup() {
	linux-mod_pkg_setup
	
	check_KV
	
	if kernel_is 2 4 ; then
		die "${P} does not support building against kernel 2.4.x"
	fi
}

src_install() {
	linux-mod_src_install
	
	if use pcmcia ; then
		insinto /etc/modules.d/
		doins ${FILESDIR}/ibdriver
		
		if [ `KV_to_int ${KV}` -lt `KV_to_int 2.6.13` ] ; then
			insinto /etc/pcmcia/
			doins ${FILESDIR}/iburst.conf
		fi
	fi
}

pkg_postinst() {
	linux-mod_pkg_postinst
}
