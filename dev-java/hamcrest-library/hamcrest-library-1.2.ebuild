# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
JAVA_PKG_IUSE="doc source"
inherit java-pkg-2 java-ant-2

MY_PN="hamcrest"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Extended library of matchers for building test expressions."
HOMEPAGE="http://code.google.com/p/${MY_PN}/"
SRC_URI="http://${MY_PN}.googlecode.com/files/${MY_P}.tgz"
LICENSE="BSD-2"
SLOT="1.2"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE=""

CDEPEND="~dev-java/hamcrest-core-${PV}"
DEPEND=">=virtual/jdk-1.5
	~dev-java/hamcrest-generator-${PV}
	userland_GNU? ( sys-apps/findutils )
	${CDEPEND}"
RDEPEND=">=virtual/jre-1.5
	${CDEPEND}"

JAVA_ANT_CLASSPATH_TAGS="${JAVA_ANT_CLASSPATH_TAGS} javadoc java-to-jar java"
EANT_BUILD_TARGET="library"
EANT_EXTRA_ARGS="-Dversion=${PV}"
EANT_GENTOO_CLASSPATH="hamcrest-core-${SLOT}"
JAVA_ANT_REWRITE_CLASSPATH=1

src_prepare() {
	# Don't include source in JAR.  If a Gentoo user wants the source the source
	# USE flag will be enabled
	epatch "${FILESDIR}/hamcrest-1.2-no_source_in_jar.patch"
	# Empty out the contents of the generator target; it has already been built.
	epatch "${FILESDIR}/hamcrest-1.2-empty_generator.patch"
	# Empty out the contents of the core target; it has already been built.
	epatch "${FILESDIR}/hamcrest-1.2-empty_core.patch"
	# Fix problems with Javadoc target
	epatch "${FILESDIR}/hamcrest-library-1.2-fix_javadoc.patch"

	find -iname "*.jar" -exec rm -v {} + || die "Unable to remove bundled JAR files"

	# copy package.html from hamcrest-core to hamcrest-library to so that
	# the org.hamcrest package is documented
	cp hamcrest-core/src/main/java/org/hamcrest/package.html \
		${PN}/src/main/java/org/hamcrest/

	local cp="build/${P}.jar"
	cp="${cp}:$(java-pkg_getjars --build-only --with-dependencies hamcrest-generator-${SLOT})"
	EANT_GENTOO_CLASSPATH_EXTRA="${cp}"
}

src_install() {
	java-pkg_newjar build/${PN}-${PV}.jar ${PN}.jar

	dodoc README.txt CHANGES.txt

	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc ${PN}/src/main/java/org
}
