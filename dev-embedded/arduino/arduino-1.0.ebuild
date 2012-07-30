# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# This version developed from the portage 0017 ebuild by paulj:
#  Header: /var/cvsroot/gentoo-x86/dev-embedded/arduino/arduino-0017.ebuild,v 1.1 2009/10/17 18:15:07 nixphoeni Exp $

EAPI=4
inherit eutils

DESCRIPTION="Arduino is an open-source AVR electronics prototyping platform"
HOMEPAGE="http://arduino.cc/"
SRC_URI="http://arduino.googlecode.com/files/${P}-src.tar.gz"
LICENSE="GPL-2 LGPL-2 CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
RESTRICT="strip binchecks"
IUSE="java"
RDEPEND="dev-embedded/avrdude sys-devel/crossdev"

# dev-java/rxtx needs to be > 2.1 otherwise the serial connection will not work
DEPEND="${RDEPEND} java? ( virtual/jre dev-embedded/uisp dev-java/jikes >dev-java/rxtx-2.1 dev-java/antlr )"

pkg_setup() {
	[ ! -x /usr/bin/avr-g++ ] && ewarn "Missing avr-g++; you need to crossdev -s4 avr"
}

pkg_postinst() {
	pkg_setup
	einfo "Copy /usr/share/${P}/hardware/cores/arduino/Makefile and edit it to suit the project"
}

src_prepare() {
	#epatch "${FILESDIR}"/Makefile-${PV}.patch
	rm -rf build/linux/tools/avrdude*
	if ! use java; then
		rm -rf lib
		rm -f arduino
	else
		# fix the provided arduino script to call out the right
		# libraries, remove resetting of $PATH, and fix its
		# reference to LD_LIBRARY_PATH (see bug #189249)
		epatch "${FILESDIR}"/arduino-script-${PV}.patch

		# Fix the deprecated reference to prog_char in
		# hardware/arduino/cores/arduino/Print.cpp
		epatch "${FILESDIR}"/print-code-${PV}.patch

		# Patch build/build.xml - remove local jar files
		# for rxtx and ecj (use system wide versions)
		epatch "${FILESDIR}"/build-${PV}.patch

		# Remove the rxtx libraries to ensure the system
		# libraries are used
		rm build/linux/dist/lib/*
	fi
}

src_compile() {
	cd build
	ant
}

src_install() {
	mkdir -p "${D}/usr/share/${P}/" "${D}/usr/bin"
	cp -a "${S}" "${D}/usr/share/"
	fowners -R root:uucp "/usr/share/${P}/hardware"
	if use java; then
		sed -e  s@__PN__@${P}@g < "${FILESDIR}"/arduino > "${D}/usr/bin/arduino"
		chmod +x "${D}/usr/bin/arduino"

		# use system avrdude
		# patching class files is too hard
		dosym /usr/bin/avrdude "/usr/share/${P}/hardware/tools/avrdude"
		dosym /etc/avrdude.conf "/usr/share/${P}/hardware/tools/avrdude.conf"

		# Make the program accessible through the $PATH
		dosym "/usr/share/${P}/build/linux/work/arduino" /usr/local/bin/arduino

		# IDE tries to compile these libs at first start up
		fperms -R g+w "/usr/share/${P}/libraries"
	fi

	dodoc readme.txt
}

