# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/ant-ivy/ant-ivy-2.0.0.ebuild,v 1.6 2010/01/23 14:26:58 aballier Exp $

EAPI="4"

JAVA_PKG_IUSE="doc examples source test"
# rewrites examples otherwise... bad
JAVA_PKG_BSFIX_ALL="no"

inherit base java-pkg-2 java-ant-2 eutils

MY_PN="apache-ivy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Ivy is a free java based dependency manager"
HOMEPAGE="http://ant.apache.org/ivy"
SRC_URI="mirror://apache/ant/ivy/${PV}/${MY_P}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="2.2"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEP="
	dev-java/ant-core:0
	dev-java/bcpg:0
	dev-java/bcprov:0
	dev-java/commons-httpclient:3
	dev-java/commons-vfs:0
	dev-java/jakarta-oro:2.0
	dev-java/jsch:0"

DEPEND="
	>=virtual/jdk-1.4
	test? (
		dev-java/ant-testutil:0
		dev-java/commons-lang:2.1
		dev-java/ant-junit:0 )
	${COMMON_DEP}"

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"

S="${WORKDIR}/${MY_P}"

JAVA_ANT_REWRITE_CLASSPATH="yes"
EANT_GENTOO_CLASSPATH="ant-core,commons-vfs,jakarta-oro-2.0,jsch
	commons-httpclient-3,bcpg,bcprov"
EANT_BUILD_TARGET="/offline jar"
EANT_EXTRA_ARGS="-Dbuild.version=${PV} -Dbundle.version=${PV}"


#ecj causes error:
#The type org.apache.commons.logging.Log cannot be resolved. It is indirectly referenced from required .class files
JAVA_PKG_FORCE_COMPILER="javac"

java_prepare() {
	epatch "${FILESDIR}"/${P}-build.xml.patch
	#do not delete jars as they are for test purposes only
	#find "${S}" -name '*.jar' -delete
	mkdir "${S}"/lib || die
}

EANT_TEST_GENTOO_CLASSPATH="${EANT_GENTOO_CLASSPATH},ant-testutil,commons-lang-2.1"
EANT_TEST_EXTRA_ARGS="-Divy.home=${T}"
EANT_TEST_TARGET="/offline test"

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_dojar "build/artifact/jars/ivy.jar"

	use doc && java-pkg_dojavadoc "build/doc/reports/api"
	use doc && dohtml -r "doc"
	use examples && java-pkg_doexamples "src/example"
	use source && java-pkg_dosrc src/java/*

	java-pkg_register-ant-task
}
