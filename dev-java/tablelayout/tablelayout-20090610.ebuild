# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2

DESCRIPTION="TableLayout is a totally free layout manager designed to make creating user interfaces fast and easy."
HOMEPAGE="https://tablelayout.dev.java.net/"
SRC_URI="https://tablelayout.dev.java.net/files/documents/3495/15739/TableLayout-src-2009-06-10.jar"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
IUSE=""

JAVA_VERSION="1.5"
DEPEND=">=virtual/jdk-${JAVA_VERSION}"
RDEPEND=">=virtual/jre-${JAVA_VERSION}"

SRC_DIR="${S}/src"
JAVADOC_DIR="${S}/javadoc"

src_unpack() {
	unpack ${A}
	rm -r "${WORKDIR}"/META-INF || die "error removing dir META-INF"
	mkdir -p ${SRC_DIR}
	mv "${WORKDIR}"/info "${SRC_DIR}"
}

src_compile() {
	#Compile
	mkdir classes
	ejavac -d classes $(find src/ -name "*.java") || die "Compilation failed"
	#Make jar
	jar -cf "${S}/${PN}.jar" -C classes . || die "Could not create jar"
	#Generate javadoc
	if use doc ; then
		mkdir "${JAVADOC_DIR}" || die "Could not create javadoc dir"
		cd ${SRC_DIR}
		javadoc -source "${JAVA_VERSION}" -d ${JAVADOC_DIR} "info.clearthought.layout" || die "Could not create javadoc"
	fi
}

src_install() {
	java-pkg_dojar ${PN}.jar
	use doc && java-pkg_dojavadoc "${JAVADOC_DIR}"
	use source && java-pkg_dosrc "${SRC_DIR}/*"
}
