# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Java-based STUN implementation"
HOMEPAGE="http://jstun.javawi.de/"
SRC_URI="http://${PN}.javawi.de/${P}.src.tar.gz"

LICENSE="|| ( GPL-2 Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

COMMON_DEP="dev-java/slf4j-api"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	${COMMON_DEP}"

S="${WORKDIR}/STUN"

EANT_BUILD_XML="build/build.xml"

java_prepare() {
	rm -v *.jar || die
	rm -v build/*.jar || die

	java-pkg_jar-from slf4j-api
}

src_install() {
	java-pkg_newjar target/${P}.jar ${PN}.jar
	use doc && java-pkg_dojavadoc target/javadoc
	use source && java-pkg_dosrc src
}
