# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2

DESCRIPTION="InfoNode Tabbed Panel is a highly flexible and customizable replacement for the Swing JTabbedPane component."
HOMEPAGE="http://infonode.net/index.html?itp"
MY_P="${PN}-gpl-${PV}"
SRC_URI="mirror://sourceforge/infonode/${MY_P}-src.zip"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
JAVA_VERSION="1.4"
DEPEND=">=virtual/jdk-${JAVA_VERSION}"
RDEPEND=">=virtual/jre-${JAVA_VERSION}"
S="${WORKDIR}/${MY_P}"
SRC_DIR="${S}/src"
CLASSES_DIR="${WORKDIR}/classes"
JAVADOC_DIR="${S}/javadoc"

src_compile() {
	#Compile
	mkdir "${CLASSES_DIR}" || die "Could not create compile output dir"
        ejavac -d "${CLASSES_DIR}" $(find "${SRC_DIR}" -name "*.java") || die "Compilation failed"
	#Make jar
	jar -cf "${S}/${PN}.jar" -C "${CLASSES_DIR}" . || die "Could not create jar"
	#Generate javadoc
	if use doc ; then
		mkdir "${JAVADOC_DIR}" || die "Could not create javadoc dir"
		cd ${SRC_DIR}
		javadoc -source "${JAVA_VERSION}" -d ${JAVADOC_DIR} $(find "net/infonode" -type d | tr '/' '.') || die "Could not create javadoc"
	fi
}

src_install() {
	java-pkg_dojar ${PN}.jar
	use doc && java-pkg_dojavadoc "${JAVADOC_DIR}"
        use source && java-pkg_dosrc "${SRC_DIR}/*"
}