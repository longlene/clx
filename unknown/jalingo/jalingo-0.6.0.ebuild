# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="JaLingo is a free OS independent dictionary application."
HOMEPAGE="http://jalingo.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.7z"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
JAVA_VERSION="1.5"
COMMON_DEPEND="dev-java/commons-logging
	>=dev-java/kunststoff-2.0
	>=dev-java/itp-1.4
	>=dev-java/tablelayout-0.1"
DEPEND="app-arch/p7zip
	dev-java/ant-core
	>=virtual/jdk-${JAVA_VERSION}
	${COMMONT_DEPEND}"
RDEPEND=">=virtual/jre-${JAVA_VERSION}
	${COMMON_DEPEND}"
S="${WORKDIR}/${P}-src/"

src_unpack() {
	unpack ${A}
	rm -rf ${S}/lib/* ${S}/lib.test/*
	cd ${S}/lib
	java-pkg_jar-from commons-logging
	java-pkg_jar-from kunststoff-2.0
	java-pkg_jar-from itp
	java-pkg_jar-from tablelayout
}

src_compile() {
	#Compile
	eant compile_src
	#Make jar
	jar -cf "${S}/${PN}.jar" -C "build/src" . || die "Could not create jar"
	#TODO: add javadoc?
}

src_install() {
	java-pkg_dojar ${PN}.jar || die "Could not publish jar"
	use source && java-pkg_dosrc "${S}/src/*" "${S}/src.shared/*"
	doicon ${S}/src/resources/icons/${PN}.png
	java-pkg_dolauncher ${PN} --main "ja.lingo.application.JaLingo" || die "Could not create launcher"
	make_desktop_entry ${PN} "JaLingo" ${PN}.png "Education;Languages"
}