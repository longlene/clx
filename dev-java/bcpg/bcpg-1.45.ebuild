# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/bcmail/bcmail-1.45.ebuild,v 1.7 2012/05/12 03:42:10 aballier Exp $

EAPI=4

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_P="${PN}-jdk15-${PV/./}"
DESCRIPTION="Java cryptography APIs"
HOMEPAGE="http://www.bouncycastle.org/java.html"
SRC_URI="http://www.bouncycastle.org/download/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND="~dev-java/bcprov-${PV}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEPEND}"
RDEPEND=">=virtual/jre-1.5
	${COMMON_DEPEND}"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	default
	cd "${S}"
	unpack ./src.zip
}

java_prepare() {
	mkdir "${S}/classes"

	#remove tests
	rm -rf org/bouncycastle/openpgp/test \
		org/bouncycastle/openpgp/examples/test
}

src_compile() {

	find org -name "*.java" > "${T}/src.list"
	ejavac -d "${S}/classes" \
		-classpath $(java-pkg_getjars bcprov) \
		"@${T}/src.list"

	cd "${S}/classes"
	jar -cf "${S}/${PN}.jar" * || die "failed to create jar"
}

src_install() {
	java-pkg_dojar "${S}/${PN}.jar"

	use source && java-pkg_dosrc org
	use doc && java-pkg_dojavadoc docs
}
