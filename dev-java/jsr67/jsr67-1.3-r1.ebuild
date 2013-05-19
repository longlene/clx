# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/jsr67/jsr67-1.3-r1.ebuild,v 1.0 2011/03/24 11:44:09 nico Exp $

# Based on dev-java/jsr67-1.3 ebuild and dev-java/jsr223-1.0-r1 ebuild. –nico

EAPI="2"
JAVA_PKG_IUSE=""

inherit java-pkg-2

DESCRIPTION="SAAJ 1.3 (AKA JSR-67 MR3) API"
HOMEPAGE="https://java.net/projects/saaj/"

SRC_URI="https://svn.java.net/svn/saaj~svn/tags/t200912141258/repo/javax.xml.soap/java-sources/saaj-api-1.3-sources.jar"

LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"

IUSE=""

RDEPEND=">=virtual/jre-1.4"
DEPEND=""

S="${WORKDIR}"

src_compile() {
	mkdir build || die
	ejavac -d build javax/xml/soap/*.java
	jar -cf saaj-api.jar -C build javax || die
}

src_install() {
	java-pkg_newjar saaj-api.jar
}
