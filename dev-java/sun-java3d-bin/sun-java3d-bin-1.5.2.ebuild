# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/sun-java3d-bin/sun-java3d-bin-1.4.0_pre5-r1.ebuild,v 1.3 2007/11/17 18:33:10 wltjr Exp $

inherit java-pkg-2

MY_PV=${PV//./_}
MY_PV=${MY_PV//_pre/-build}
MY_IPV=${MY_PV//_/}

DESCRIPTION="Sun Java3D API Core"
HOMEPAGE="https://j3d-core.dev.java.net/"
SRC_URI="
	amd64? (
		http://download.java.net/media/java3d/builds/release/${PV}/j3d-${MY_PV}-linux-amd64.zip
	)
	x86? (
		http://download.java.net/media/java3d/builds/release/${PV}/j3d-${MY_PV}-linux-i586.zip
	)"
KEYWORDS="~amd64 ~x86 -*"
SLOT="0"
LICENSE="sun-jrl sun-jdl"
IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jre-1.4"

S=${WORKDIR}/${A/.zip/}

QA_TEXTRELS_x86="
	usr/lib/sun-java3d-bin/libj3dcore-ogl.so
	usr/lib/sun-java3d-bin/libj3dutils.so"

src_unpack() {
	unpack ${A}
	cd "${S}"
	if use x86 ;then
		unzip -q j3d-1_5_2-linux-i586/j3d-jre.zip || die
	fi
	if use amd64 ;then
		unzip -q j3d-1_5_2-linux-amd64/j3d-jre.zip || die
	fi
	}

src_compile() { :; }

src_install() {
	dodoc COPYRIGHT.txt README.txt

	java-pkg_dojar lib/ext/*.jar
	java-pkg_doso lib/${ARCH/x86/i386}/*.so
}

pkg_postinst() {
	elog "This ebuild installs into ${JAVA_PKG_LIBDEST} and ${JAVA_PKG_JARDEST}"
	elog 'To use this when writing your own applications you can use for example:'
	elog '-Djava.library.path=$(java-config -i sun-java3d-bin) -cp $(java-config -p sun-java3d-bin)'
}
