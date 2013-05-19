# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/lucene/lucene-2.4.0.ebuild,v 1.3 2008/11/01 09:39:23 robbat2 Exp $

JAVA_PKG_IUSE="doc source"
EANT_BUILD_TARGET=jars
EAPI=2

inherit java-pkg-2 java-ant-2

DESCRIPTION="High-performance JSON processor"
HOMEPAGE="http://jackson.codehaus.org"
SRC_DIR="${PN}-src-${PV}"
SRC_URI="http://jackson.codehaus.org/${PV}/${SRC_DIR}.tar.gz"
LICENSE="|| ( Apache-2.0 LGPL-2.1 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND=">=virtual/jre-1.5
	dev-java/jsr311-api"
DEPEND="${RDEPEND}
	>=virtual/jdk-1.5
	dev-java/ant-nodeps"
S="${WORKDIR}/${SRC_DIR}"

java_prepare() {
	cd "${S}"
	java-pkg_jar-from --into lib/jaxrs jsr311-api
}

src_install() {
	dodoc README.txt  release-notes/{VERSION,TODO,CREDITS} || die
	for i in jaxrs {mapper,core}-{asl,lgpl} ; do
		java-pkg_newjar build/${PN}-${i}-${PV}.jar ${PN}-${i}.jar
	done

	use doc && java-pkg_dohtml -r build/javadoc
	use source && java-pkg_dosrc src/java/org src/jaxrs/java
}

src_test() {
	java-pkg-2_src_test
}
