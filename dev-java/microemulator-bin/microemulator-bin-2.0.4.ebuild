# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-utils-2

DESCRIPTION="Pure Java implementation of J2ME in J2SE"
SRC_URI="mirror://sourceforge/microemulator/microemulator-${PV}.zip"
HOMEPAGE="http://www.microemu.org/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="examples"

RDEPEND=">=virtual/jre-1.4"

S="${WORKDIR}/microemulator-${PV}"

src_unpack() {
	unpack ${A}
	cd "$S"
	use examples && sed -i \
	"s|archive=\"lib/microemu-javase-applet.jar,apps/microemu-demo.jar\"|archive=\"../../../${PN}/lib/microemu-javase-applet.jar,microemu-demo.jar\"|"	\
		microemu-demo.html
}

src_compile() { :; }

src_install() {
	java-pkg_dojar microemulator.jar lib/*.jar devices/*.jar
	java-pkg_dolauncher microemulator --main org.microemu.app.Main

	use examples && java-pkg_doexamples apps/* microemu-demo.html

	dodoc CREDITS README TODO
	make_desktop_entry '/usr/bin/microemulator' 'MicroEmulator' '' \
		'Development;Emulator'
}

