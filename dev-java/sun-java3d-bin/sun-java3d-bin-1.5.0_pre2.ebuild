# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/sun-java3d-bin/sun-java3d-bin-1.4.0_pre5.ebuild,v 1.1 2005/09/10 14:46:03 axxo Exp $

inherit java-pkg

MY_PV=${PV//./_}
MY_PV=${MY_PV//_pre/-build}
MY_IPV=${MY_PV//_/}

DESCRIPTION="Sun Java3D API Core"
HOMEPAGE="https://j3d-core.dev.java.net/"
SRC_URI="
	amd64? (
		http://download.java.net/media/java3d/builds/stable/${MY_PV}/java3d-${MY_PV}-linux-amd64.zip
	)
	x86? (
		http://download.java.net/media/java3d/builds/stable/${MY_PV}/java3d-${MY_PV}-linux-i586.zip
	)"
KEYWORDS="~amd64 ~x86 -*"
SLOT="0"
LICENSE="sun-jrl sun-jdl"
IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jre-1.5"

S=${WORKDIR}/${A/.zip/}

src_unpack() {
	unpack ${A}
	cd ${S}
	unzip -q j3d-${MY_IPV}-linux-${ARCH}.zip || die
}

src_compile() { :; }

src_install() {
	dodoc COPYRIGHT.txt README.txt

	java-pkg_dojar lib/ext/*.jar
	java-pkg_doso lib/${ARCH/x86/i386}/*.so
}

pkg_postinst() {
	ewarn "This ebuild installs into /opt/${PN} and /usr/share/${PN}"
	ewarn 'To use you need to pass the following to java'
	ewarn '-Djava.library.path=$(java-config -i sun-java3d-bin) -cp $(java-config -p sun-java3d-bin)'
}
