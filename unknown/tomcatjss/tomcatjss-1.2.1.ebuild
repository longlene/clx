# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 

DESCRIPTION="JSSE implementation using JSS for Tomcat"
HOMEPAGE="http://pki.fedoraproject.org"
SRC_URI="http://pki.fedoraproject.org/pki/sources/${PN}/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEP="www-servers/tomcat:5.5
		dev-java/jss
		dev-java/commons-logging
		!!dev-java/tomcat-native"

RDEPEND="virtual/jre:1.6
	${COMMON_DEP}"

DEPEND="virtual/jdk:1.6
	${COMMON_DEP}"

src_prepare() {
	epatch "${FILESDIR}"/gentoo-jar-location.patch || die
	java-pkg_jar-from jss-3.4 xpclass.jar jss4.jar
	java-pkg_jar-from commons-logging commons-logging-api.jar
	java-pkg_jar-from tomcat-5.5 tomcat-util.jar
}

src_compile() {
	eant ${antflags} compile ||die
}
