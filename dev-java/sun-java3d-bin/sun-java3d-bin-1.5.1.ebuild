# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_PV=${PV//./_}
MY_PV=${MY_PV//_pre/-build}
MY_IPV=${MY_PV//_/}

DESCRIPTION="Sun Java3D API Core"
HOMEPAGE="https://j3d-core.dev.java.net/"
SRC_URI="
	amd64? (
		http://download.java.net/media/java3d/builds/release/${PV}/java3d-${MY_PV}-linux-amd64.zip
	)
	x86? (
		http://download.java.net/media/java3d/builds/release/${PV}/java3d-${MY_PV}-linux-i586.zip
	)"
#SRC_URI="http://download.java.net/media/java3d/builds/release/${PV}/java3d-${MY_PV}-linux-i586.zip"
# http://download.java.net/media/java3d/builds/release/1.5.1/java3d-1_5_1-api-docs.zip
# http://download.java.net/media/java3d/builds/release/1.5.1/java3d-1_5_1-linux-amd64.zip
# http://download.java.net/media/java3d/builds/release/1.5.1/java3d-1_5_1-linux-i586.zip
# 
LICENSE="sun-jrl sun-jdl"
SLOT="0"
KEYWORDS="~amd64 ~x86 -"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

S=${WORKDIR}/${A/.zip/}

src_unpack() {
	# unpack the downloaded .zip file
	unpack ${A}
	cd ${S} # /var/tmp/portage/dev-java/sun-java3d-bin-1.5.1/work/java3d-1_5_1-linux-i586/
	# unpack the runtime archive along with few .txt files
	unzip -q j3d-jre.zip || die
}

src_compile() { :; }

src_install() {
	dodoc COPYRIGHT.txt README.txt

	java-pkg_dojar lib/ext/*.jar
	java-pkg_doso lib/${ARCH/x86/i386}/*.so
}

pkg_postinst() {
	# the below is not true, at least no /opt/ has been touched
	elog "This ebuild installs into /opt/${PN} and /usr/share/${PN}"
	elog 'To use you need to pass the following to java'
	elog '-Djava.library.path=$(java-config -i sun-java3d-bin) -cp $(java-config -p sun-java3d-bin)'
}

