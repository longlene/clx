# By Visu@lSt@tion
# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2

DESCRIPTION="Object Oriented SNMP Implementation for Java"
SRC_URI="http://www.snmp4j.org/${P}.zip
		doc? (http://www.snmp4j.org/${PN}-doc-${PV}.zip)"
HOMEPAGE="http://www.snmp4j.org"
LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc64 ~sparc ~ppc"
IUSE="doc source jikes"

DEPEND=">=virtual/jdk-1.4
	dev-java/ant-core
	source? ( app-arch/zip )"

S="${WORKDIR}/snmp4j"

src_unpack() {
	unpack ${A}
	cd ${S}
	rm -rf dist/
}

src_compile() {
	local antflags="archive"
	ant ${antflags} || die "compilation error"
}

src_install() {
	java-pkg_newjar dist/lib/SNMP4J.jar ${PN}.jar
	use doc && java-pkg_dohtml -r doc/*
	use source && java-pkg_dosrc src/*

	# create wrapper script
	java-pkg_dolauncher SNMP4J --main org.snmp4j.tools.console.SnmpRequest
}

pkg_postinst() {
	einfo "Use command 'SNMP4J' to run SNMP console."
}
