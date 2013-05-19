# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/slf4j-api/slf4j-api-1.5.11.ebuild,v 1.5 2010/10/14 16:59:11 ranger Exp $

EAPI="4"
JAVA_PKG_IUSE="doc source examples"

inherit eutils java-pkg-2

#java-ant-2?

MY_PN="antlr3-task"
# just a runtime dependency
ANT_TASK_DEPNAME=""

DESCRIPTION="Apache Ant's optional tasks for Antlr V3"
HOMEPAGE="http://www.antlr.org/wiki/pages/viewpage.action?pageId=24805671"
SRC_URI="http://www.antlr.org/share/1169924912745/${MY_PN}.zip
	-> ${PN}.zip"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

JAVA_PKG_BSFIX_NAME="" #do not rewrite anything

CDEPEND="dev-java/ant-core
	dev-java/antlr:3[java]"

RDEPEND=">=virtual/jre-1.5
	${CDEPEND}"

DEPEND=">=virtual/jdk-1.5
	${CDEPEND}"

S="${WORKDIR}/${MY_PN}"

src_compile() {
	local srcdir=antlr3-src/src
	local deps=$(java-pkg_getjars --with-dependencies ant-core,antlr-3)
	mkdir -p build/classes
	ejavac -sourcepath ${srcdir} -d build/classes -classpath \
		${deps} $(find ${srcdir} -name "*.java") || die "Cannot compile sources"
	cp ${srcdir}/org/apache/tools/ant/antlr/antlib.xml \
		build/classes/org/apache/tools/ant/antlr/antlib.xml
	jar -cvf "build/${PN}.jar" -C  build/classes . || die "Cannot create JAR"
	if use doc ; then
		mkdir build/javadoc
		javadoc -d build/javadoc -sourcepath ${srcdir} -subpackages org -classpath ${deps}
	fi
}

src_install() {
	java-pkg_dojar build/${PN}.jar
	java-pkg_register-ant-task

	use source && java-pkg_dosrc antlr3-src/src/org
	use doc && java-pkg_dojavadoc build/javadoc
	use examples && java-pkg_doexamples examples
}