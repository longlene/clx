# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod linux-info eutils

MY_PN="o2scr"
MY_P="${MY_PN}-${PV}"

S=${WORKDIR}/${MY_PN}

DESCRIPTION="O2Micro SmartCardBus PCMCIA Smartcard Reader"
HOMEPAGE="https://gna.org/projects/o2scr"
SRC_URI="http://download.gna.org/o2scr/${MY_P}.tar.bz2"

IUSE="debug"

LICENSE="LGPL"
KEYWORDS="x86"

DEPEND="sys-apps/pcsc-lite
	sys-apps/pcmcia-cs"

BUILD_PARAMS="KSRC=${ROOT}${KV_DIR} KVERS=${KV_MAJOR}${KV_MINOR}"

pkg_setup(){
	# setup module dir according to kernel version
	linux-info_pkg_setup
	MODDIR="${S}/src/ozscrlx"
	
	if use debug; then
		BUILD_PARAMS="$BUILD_PARAMS debug=1"
	fi
	BUILD_TARGETS="modules"
	MODULE_NAMES="o2scr(pcmcia:${MODDIR}:${MODDIR})"
	
	linux-mod_pkg_setup
}

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i -e 's#/usr/local/o2micro/lib_OZSCR.so#/usr/lib/readers/libo2scr.so#' etc/reader.conf
	sed -i -e 's#-I/usr/include/PCSC#`pkg-config libpcsclite --cflags`#' src/ozctapi/Makefile
}
																							


src_compile() {
	if use debug; then
		MAKEOPTS="debug=1"
	fi
	emake -C src/ozctapi || die
	linux-mod_src_compile
}

src_install() {
	exeinto /usr/lib/readers
	newexe src/ozctapi/lib_OZSCR.so libo2scr.so

	insinto /etc/reader.conf.d
	newins etc/reader.conf o2scr.conf

	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst

	einfo "Regeneratinf /etc/reader.conf..."
	update-reader.conf
}

