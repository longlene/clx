# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"
WANT_ANT_TASKS="ant-nodeps"

inherit java-pkg-2 java-ant-2

DESCRIPTION="JADE is FIPA-compliant Java Agent Development Environment"
# Fool the Portage/emerge scripts to think about the real final filename (after the last slash):
SRC_URI="http://jade.cselt.it/JADE-src-${PV}.zip"
# This is what you really should be downloading (after the login):
MY_SRC_URI="http://jade.cselt.it/dl.php?file=JADE-src-${PV}.zip"
HOMEPAGE="http://jade.cselt.it/"
IUSE=""
RESTRICT="fetch"

DEPEND=">=virtual/jdk-1.4
	app-arch/unzip"
RDEPEND=">=virtual/jre-1.4"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

S="${WORKDIR}/${PN}"

EANT_BUILD_TARGET="clean lib"
EANT_DOC_TARGET="doc"


pkg_nofetch() {
	einfo "Please download JADE-src-${PV}.zip from:"
	einfo ${MY_SRC_URI}
	einfo "(click on 'Jade 3.5 latest version' under downloads, log in, accept the licence, pick the jadeSrc.zip link)"
	einfo "and move the zip-file to ${DISTDIR}"
}

src_install() {
	java-pkg_dojar lib/*.jar
	dodoc README ChangeLog
	use doc && java-pkg_dojavadoc doc/
	use source && java-pkg_dosrc src/FIPA src/jade src/starlight
}
