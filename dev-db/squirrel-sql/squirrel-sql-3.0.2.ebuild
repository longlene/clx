# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/jasperreports/jasperreports-0.6.1-r2.ebuild,v 1.3 2005/01/20 16:02:31 mr_bones_ Exp $

#   EBD 2008-03-13 changing to gnu-classpath per Gentoo Bug 139218
#		rather than dev-java/gnu-jaxp

EAPI=7

inherit java-pkg-2 java-ant-2

DESCRIPTION="A graphical Java program that will allow you to view the structure of a JDBC compliant database, browse the data in tables, issue SQL commands etc."
HOMEPAGE="http://www.squirrelsql.org/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}-src.zip"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="jikes doc mysql oracle"
DEPEND=">=dev-java/ant-1.7
	>=dev-java/antlr-2.7
	>=dev-java/asm-3.1
	>=dev-java/cglib-2
	>=dev-java/commons-cli-1.2
	>=dev-java/commons-codec-1.3
	>=dev-java/commons-collections-3.2
	>=dev-java/commons-httpclient-3.1
	>=dev-java/commons-logging-1.1
	>=dev-java/dom4j-1.6
	>=dev-java/hibernate-3.1
	>=dev-java/hibernate-annotations-3
	>=dev-java/jgoodies-forms-1.1
	jikes? ( >=dev-java/jikes-1.22 )
	>=dev-java/log4j-1.2
	>=dev-java/nanoxml-2.2
	>=dev-java/stringtemplate-3.2
	>=virtual/jdk-1.6"
RDEPEND=">=dev-java/bsh-1.99
	dev-java/gnu-classpath
	>=dev-java/commons-beanutils-1.8
	>=dev-java/commons-collections-3.2
	>=dev-java/commons-digester-1.8
	>=dev-java/commons-logging-1.1
	>=dev-java/itext-2.1
	>=dev-java/poi-3.2
	~dev-java/servletapi-2.4
	>=dev-java/xalan-2.7
	>=dev-java/xerces-2.9
	>=virtual/jre-1.6"

S="${WORKDIR}/${PN}"
S_ARCH="${S}/sql12"
S_DIST="${S}/${PN}-dist"

JAVA_ANT_ENCODING="UTF-8"

src_unpack() {
	echo ${A}
	mkdir ${S}
	cd ${S}
	unpack ${A}

	cd ${S_ARCH}/app/lib
	#rm *.jar
	#java-pkg_jar-from jgoodies-forms

	cd ${S_ARCH}/fw/lib
	#rm *.jar
	#java-pkg_jar-from antlr
	#java-pkg_jar-from asm-3
	#java-pkg_jar-from cglib-2.2
	#java-pkg_jar-from commons-cli-1
	#java-pkg_jar-from commons-codec
	#java-pkg_jar-from commons-collections
	#java-pkg_jar-from commons-httpclient-3
	#java-pkg_jar-from commons-logging
	#java-pkg_jar-from dom4j-1.4
	#java-pkg_jar-from hibernate-3.1
	#java-pkg_jar-from hibernate-annotations-3.1
	#java-pkg_jar-from log4j
	#java-pkg_jar-from nanoxml
	#java-pkg_jar-from stringtemplate

	# EBD 2008-03-13 removed for now to see if needed
#	patch -p1 < ${FILESDIR}/forms-${PV}.patch || die

	use mysql && sed -i 's/\(rebuild.plugin.mysql\)=.*/\1=true/g' ${S_ARCH}/build/build.properties
	use oracle && sed -i 's/\(rebuild.plugin.oracle\)=.*/\1=true/g' ${S_ARCH}/build/build.properties

	#  Needs netbeans.  Didn't want to have this ebuild drag netbeans into
	#  the system.  Separate ebuild for this plugin?
	sed -i 's/\(rebuild.plugin.syntax\)=.*/\1=false/g' ${S_ARCH}/build/build.properties

	# unmappable character for encoding ASCII
	sed -i 's/\(rebuild.plugin.dataimport\)=.*/\1=false/g' ${S_ARCH}/build/build.properties
	sed -i 's/\(rebuild.plugin.exportconfig\)=.*/\1=false/g' ${S_ARCH}/build/build.properties
	sed -i 's/\(rebuild.plugin.sqlparam\)=.*/\1=false/g' ${S_ARCH}/build/build.properties
}

src_compile() {
	local antflags="-Ddist_dir=${WORKDIR}/dist"
	use jikes && antflags="${antflags} -Dbuild.compiler=jikes"
	use doc && antflags="${antflags} javadoc"
	cd ${S_ARCH}/build
	ANT_TASKS="findbugs pmd" eant compile_plugins || die "Compilation failed"
}

src_install() {
	java-pkg_jarinto /usr/share/${PN}/lib
	java-pkg_dojar ${S_DIST}/${PN}/core/dist/lib/*.jar || die "Missing jars"
	java-pkg_jarinto /usr/share/${PN}/plugins
	java-pkg_dojar ${S_DIST}/${PN}/core/dist/plugins/*.jar || die "Missing plugin jars"

	use doc && java-pkg_dohtml -r ${S_DIST}/${PN}/core/dist/doc/*

	for dir in ${S_DIST}/${PN}/dist/plugins/*; do
		cp -r `basename $dir` /usr/share/${PN}/plugins
	done

	insinto /usr/share/${PN}
	doins ${S_DIST}/${PN}/core/dist/log4j.properties

	java-pkg_dolauncher ${PN} --main net.sourceforge.squirrel_sql.client.Main
	newicon ${S_DIST}/${PN}/core/dist/icons/acorn.png ${PN}.png
	make_desktop_entry ${PN} "Squirrel SQL" ${PN}.png
}
