# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/smack/smack-2.2.1.ebuild,v 1.3 2007/04/28 20:53:04 nelchael Exp $

EAPI="2"
JAVA_PKG_IUSE="doc source"
WANT_ANT_TASKS="ant-contrib"

inherit java-pkg-2 java-ant-2 versionator

MY_P="${PN}_src_$(replace_all_version_separators '_')"

DESCRIPTION="An Open Source XMPP (Jabber) client library for instant messaging and presence"
HOMEPAGE="http://www.igniterealtime.org/projects/smack/index.jsp"
SRC_URI="http://www.igniterealtime.org/builds/${PN}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3.1"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

COMMON_DEP="dev-java/xpp3
		dev-java/commons-logging
		dev-java/jmf-bin
		dev-java/jspeex
		dev-java/jstun"

DEPEND=">=virtual/jdk-1.5
	${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"

S="${WORKDIR}/${MY_P}"

java_prepare() {
	#delete bundled jars
	rm -v *.jar build/*.jar || die
	rm -v jingle/extension/build/merge/*.jar || die
	# Speex.jar is in here and is being left bundled
	# Delete everything else
	rm -v jingle/extension/build/lib/commons-*.jar || die
	rm -v jingle/extension/build/lib/j*.jar || die

	cd "${S}/build/merge/"
	java-pkg_jar-from xpp3

	cd "${S}/jingle/extension/build/lib"
	java-pkg_jar-from commons-logging
	java-pkg_jar-from jmf-bin jmf.jar
	java-pkg_jar-from jspeex

	# jstun in merge directory
	java-pkg_jar-from --into "${S}/jingle/extension/build/merge/" jstun

	sed -i -e '/zipfileset/d' "${S}/build/build.xml" || die
}

EANT_BUILD_XML="build/build.xml"
EANT_EXTRA_ARGS="-Djavadoc.dest.dir=api"

src_install() {
	java-pkg_dojar target/*.jar

	dohtml *.html

	use doc && {
		java-pkg_dohtml -r documentation/*
		java-pkg_dojavadoc api
	}
	use source && java-pkg_dosrc source/*
}
