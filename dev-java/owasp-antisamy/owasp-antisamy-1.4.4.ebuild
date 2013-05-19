# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

JAVA_PKG_IUSE="source"

inherit java-pkg-2

MY_PN="antisamy"

DESCRIPTION="OWASP AntiSamy allows users to supply their own HTML and CSS without exposure to XSS vulnerabilities"
HOMEPAGE="https://code.google.com/p/owaspantisamy/"
SRC_URI="http://owaspantisamy.googlecode.com/files/${MY_PN}-1.4.4-src.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CDEPEND="dev-java/batik:1.7
	dev-java/commons-httpclient:3
	dev-java/nekohtml:0
	=dev-java/xml-commons-external-1.4*
	dev-java/xerces:2
	"
RDEPEND=">=virtual/jre-1.6
	${CDEPEND}"
DEPEND=">=virtual/jdk-1.6
	${CDEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	mkdir "${S}/src"
	mv "${S}"/{*.{properties,xsd},META-INF,org} "${S}/src"
}

java_prepare() {
	mkdir "${S}/classes"
}

src_compile() {
	find src/org -name "*.java" > "${T}/src.list"
	ejavac -d "${S}/classes" \
		-classpath $(java-pkg_getjars xml-commons-external-1.4,xerces-2,nekohtml,commons-httpclient-3,batik-1.7) \
		"@${T}/src.list"
	cp -r src/{*.{properties,xsd},META-INF} classes
	cd "${S}/classes"
	jar -cf "${S}/${PN}.jar" * || die "failed to create jar"
}

src_install() {
	java-pkg_dojar ${PN}.jar
	use source && java-pkg_dosrc src/org
}
