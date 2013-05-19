# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg

IUSE="doc"

MY_PN=${PN/jama/Jama}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A Java Matrix Package"
SRC_URI="http://math.nist.gov/javanumerics/jama/${MY_P}.tar.gz"
HOMEPAGE="http://math.nist.gov/javanumerics/jama/"
KEYWORDS="~x86"
SLOT="0"
LICENCE="public-domain"

DEPEND="app-arch/zip"
RDEPEND=">=virtual/jdk-1.2"


S="${WORKDIR}/${MY_PN}"

src_compile() { :; }

src_install() {
	# this is ugly...
	mkdir Jama
	mv *.class Jama/
	mkdir Jama/examples && mv examples/*.class Jama/examples/
	mkdir Jama/test && mv test/*.class Jama/test/
	mkdir Jama/util && mv util/*.class Jama/util/
	zip -rq jama.jar Jama/
	java-pkg_dojar jama.jar
	
	use doc && dohtml -r doc/*
}
