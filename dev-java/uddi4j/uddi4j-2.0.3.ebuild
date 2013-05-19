# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg eutils

MY_P="${PN}-src-${PV//./_}"
DESCRIPTION="UDDI4J is a Java class library that provides an API to interact with a UDDI (Universal Description, Discovery and Integration) registry."
HOMEPAGE="http://sourceforge.net/projects/uddi4j"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"

LICENSE="IPL-1"
SLOT="0"
KEYWORDS="~x86"
IUSE="jikes doc"

# TODO test with earlier jdk/jre's
DEPEND=">=virtual/jdk-1.4
	dev-java/ant
	app-arch/unzip
	jikes? (dev-java/jikes
			dev-java/sun-jaf-bin)"
RDEPEND=">=virtual/jre-1.4
	=dev-java/xerces-2*
	=www-servers/axis-1*
	dev-java/soap"
S="${WORKDIR}/${PN}"

# TODO you could use other packages for W3CDOM
W3CDOM="xerces-2 xercesImpl.jar"
JAXRPC="axis-1 jaxrpc.jar"
SAAJ="axis-1 saaj.jar"
SOAP="soap soap.jar"
AXIS="axis-1 axis.jar"
ACTIVATION="sun-jaf-bin activation.jar"


src_unpack() {
	unpack ${A}
	cd ${S}

	epatch ${FILESDIR}/${P}-gentoo.patch

	echo w3cdom.location = `java-pkg_getjar ${W3CDOM}` > build.properties
	echo jaxrpc.location = `java-pkg_getjar ${JAXRPC}` >> build.properties
	echo saaj.location = `java-pkg_getjar ${SAAJ}` >> build.properties
	echo apache.soap.location = `java-pkg_getjar ${SOAP}` >> build.properties
	echo apache.axis.location = `java-pkg_getjar ${AXIS}` >> build.properties
}

src_compile() {
	local antflags="compile"
	use doc && antflags="${antflags} javadocs"
	if use jikes; then
		antflags="${antflags} -Dbuild.compiler=jikes"
		antflags="${antflags} -lib `java-pkg_getjar ${ACTIVATION}`"
	fi
	ant ${antflags} || die "Compilation failed"
}

src_install() {
	java-pkg_dojar build/lib/${PN}.jar

	dodoc README
	dohtml ReleaseNotes.html
	use doc && java-pkg_dohtml -r docs/* build/javadocs/*
}
