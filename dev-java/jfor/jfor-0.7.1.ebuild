# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
JAVA_PKG_IUSE="doc source"
WANT_ANT_TASKS="ant-nodeps"

inherit java-pkg-2 java-ant-2 eutils

DESCRIPTION="Jfor is open source software used to convert XML documents conforming to the XSL-FO specification to RTF format"
HOMEPAGE="http://www.jfor.org/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-src-V_0_7_1.tar.gz"

LICENSE="Apache-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#COMMON_DEP="dev-java/xerces:1.3"
COMMON_DEP=""

DEPEND=">=virtual/jdk-1.4
	${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"

S="${WORKDIR}/${PN}"
EANT_BUILD_TARGET="dist"

java_prepare() {
	# for ecj-3.5
	java-ant_rewrite-bootclasspath auto
	
	cd "${S}/lib/"
	rm -f *.jar
	cd "${S}"

#	java-pkg_jar-from commons-logging

}

src_install() {
	java-pkg_dojar dist/lib/${PN}.jar
	use doc && java-pkg_dojavadoc build/docs/api
	use source && java-pkg_dosrc src/*
}
