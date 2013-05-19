# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/jasperreports/jasperreports-0.6.1-r2.ebuild,v 1.3 2005/01/20 16:02:31 mr_bones_ Exp $

#   EBD 2008-03-13 changing to gnu-classpath per Gentoo Bug 139218
#		rather than dev-java/gnu-jaxp

inherit java-pkg-2

DESCRIPTION="A graphical Java program that will allow you to view the structure of a JDBC compliant database, browse the data in tables, issue SQL commands etc."
HOMEPAGE="http://www.squirrelsql.org/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}-src.zip"
LICENSE="LGPL-2.1"
SLOT="2"
KEYWORDS="~x86"
IUSE="jikes doc mysql oracle"
DEPEND=">=virtual/jdk-1.5
	>=dev-java/ant-core-1.6.5
	>=dev-java/ant-tasks-1.6.5
	>=dev-java/nanoxml-2.2
	>=dev-java/commons-cli-1.0-r4
	>=dev-java/jgoodies-forms-1.0.5
	jikes? ( >=dev-java/jikes-1.21 )"
RDEPEND=">=virtual/jre-1.4
	dev-java/gnu-classpath
	>=dev-java/itext-1.02
	>=dev-java/bsh-1.99
	>=dev-java/commons-beanutils-1.6.1
	>=dev-java/commons-collections-3.1
	>=dev-java/commons-digester-1.5
	>=dev-java/commons-logging-1.0.4
	>=dev-java/poi-2
	~dev-java/servletapi-2.3
	>=dev-java/xalan-2.5.2
	>=dev-java/xerces-2.6.2-r1"

S=${WORKDIR}/${PN}

src_unpack() {
	echo ${A}
	mkdir ${S}
	cd ${S}
	unpack ${A}
	cd sql12
	( cd fw/lib; rm *.jar; java-pkg_jar-from nanoxml )
	( cd app/lib; rm *.jar; java-pkg_jar-from jgoodies-forms; java-pkg_jar-from commons-cli-1; java-pkg_jar-from log4j )

	
	# EBD 2008-03-13 removed for now to see if needed
#	patch -p1 < ${FILESDIR}/forms-${PV}.patch || die

	use mysql && sed -i 's/\(rebuild.plugin.mysql\)=.*/\1=true/g' build/build.properties
	use oracle && sed -i 's/\(rebuild.plugin.oracle\)=.*/\1=true/g' build/build.properties

	#  Needs netbeans.  Didn't want to have this ebuild drag netbeans into
	#  the system.  Separate ebuild for this plugin?
	sed -i 's/\(rebuild.plugin.syntax\)=.*/\1=false/g' build/build.properties

}

src_compile() {
	local antflags="-Ddist_dir=${WORKDIR}/dist"
	use jikes && antflags="${antflags} -Dbuild.compiler=jikes"
	use doc && antflags="${antflags} javadoc"
	cd ${S}/sql12/build
	eant compile_plugins || die "Compilation failed"
}

src_install() {
	DSTPN=${PN}-${SLOT}
	java-pkg_dojar ${WORKDIR}/squirrel-sql/squirrel-sql-dist/squirrel-sql/core/dist/lib/*.jar || die "Missing jars"
	use doc && java-pkg_dohtml -r ${WORKDIR}/squirrel-sql/squirrel-sql-dist/squirrel-sql/core/dist/doc/*

	java-pkg_jarinto /usr/share/${DSTPN}/plugins
	java-pkg_dojar ${WORKDIR}/squirrel-sql/squirrel-sql-dist/squirrel-sql/core/dist/plugins/*.jar || die "Missing plugin jars"
	for dir in ${WORKDIR}/squirrel-sql/squirrel-sql-dist/squirrel-sql/plugins/*; do 
		cp -r $dir/dist/`basename $dir` ${D}/usr/share/${DSTPN}/plugins
	done
	sed -e "s@%INSTALL_PATH@/usr/share/${DSTPN}@" -e 's///' ${WORKDIR}/squirrel-sql/squirrel-sql-dist/squirrel-sql/core/dist/squirrel-sql.sh > ${WORKDIR}/squirrel-sql/squirrel-sql-dist/${DSTPN}
	exeinto /usr/bin
	doexe ${WORKDIR}/squirrel-sql/squirrel-sql-dist/${DSTPN}

	insinto /usr/share/${DSTPN}
	doins ${WORKDIR}/squirrel-sql/squirrel-sql-dist/squirrel-sql/core/dist/log4j.properties
}
