# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Some java libary"
HOMEPAGE="http://kxml.objectweb.org/index.html"

MY_PV=0${PV/./}

SRC_URI="http://kxml.objectweb.org/software/downloads/old/${PN}-${MY_PV}.zip"
LICENSE="Enhydra"
SLOT="1"
KEYWORDS="~x86"

IUSE=""

RDEPEND=">=virtual/jre-1.5"

DEPEND=">=virtual/jdk-1.5
	${RDEPEND}	
	>=dev-java/ant-core-1.6.2
	app-arch/unzip"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	unzip ${WORKDIR}/kxml-source.zip > /dev/null || die "Unable to unpack source"
	cp ${FILESDIR}/build.xml . || die "Unable to copy build.xml"
}

src_compile() {
	eant
}

src_install() {
	java-pkg_dojar lib/${PN}.jar
}

