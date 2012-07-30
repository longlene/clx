# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod

DESCRIPTION="Linux driver for the ArrayComm(TM) \"iBurst(TM)\" wireless broadband devices."

SRC_URI="mirror://sourceforge/ibdriver/ibdriver-${PV}.tar.gz"
LICENSE="GPL"

KEYWORDS="~x86"
IUSE="pcmcia usb"

DEPEND="!net-wireless/iburst-driver"

MOD_DIR="/lib/modules/${KV}/"
S=${WORKDIR}/ibdriver-${PV}

src_unpack() {
	unpack ${A}	
	
	convert_to_m ${S}/Makefile
	
	# sysfs patch
#	cd ${S}
#	epatch ${FILESDIR}/patch-2.6.13.4-ibdriver-2.0.0.diff
}

src_compile() {
	set_arch_to_kernel
	emake || die "emake failed"
	set_arch_to_portage
}

src_install() {
	dodir ${MOD_DIR}/net
	
	# install common net module
	cp ${S}/ib-net.ko  ${D}/${MOD_DIR}/net
	
	# install pcmcia module
	if use pcmcia; then
		cp ${S}/ib-pcmcia.ko  ${D}/${MOD_DIR}/net
		
		insinto /etc/modules.d/
		doins ${FILESDIR}/iburst
		
		insinto /etc/pcmcia/
		doins ${FILESDIR}/iburst.conf
	fi
	
	# install usb module
	if use usb; then
		cp ${S}/ib-usb.ko  ${D}/${MOD_DIR}/net
	fi
}
