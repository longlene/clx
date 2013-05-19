# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2
DESCRIPTION="Ant tasks for JAXB"
HOMEPAGE="http://jaxb.dev.java.net/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"
LICENSE="CDDL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=virtual/jdk-1.4
	dev-java/ant-core
	>=dev-java/jaxb-tools-2.1
	dev-java/istack-commons-tools"
RDEPEND="${DEPEND}"
S="${WORKDIR}/jaxb-ri"

# Steps to recreate tarball:
# wget https://jaxb.dev.java.net/${PV}/jaxb-ri-${PV//./_}.src.zip
# unzip jaxb-ri-${PV//./_}.src.zip jaxb-ri/xjc/facade/\*.java
# tar cvjf ${P}.tar.bz2 jaxb-ri

src_unpack() {
	unpack ${A}
}

src_compile() {
	local PACKAGES=ant-core,jaxb-tools-2,istack-commons-tools
	ejavac -cp $(java-config -p ${PACKAGES}):$(java-config --tools) \
		-d . $(find xjc -name \*.java) || die
	jar cf ${PN}.jar com || die
}

src_install() {
        java-pkg_dojar ${PN}.jar || die
        java-pkg_register-ant-task || die
}
