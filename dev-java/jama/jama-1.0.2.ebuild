# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg

IUSE="doc source"

MY_PN=${PN/jama/Jama}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A Java Matrix Package"
SRC_URI="http://math.nist.gov/javanumerics/jama/${MY_P}.tar.gz"
HOMEPAGE="http://math.nist.gov/javanumerics/jama/"
KEYWORDS="~x86"
SLOT="0"
LICENSE="public-domain"

DEPEND=">=virtual/jdk-1.2"

RDEPEND=">=virtual/jre-1.2
	source? ( app-arch/zip )"

S=${WORKDIR}

src_compile() {
	find Jama -name *.java | xargs $(java-config -c) || die "Failed to compile"
	find Jama -name *.class | xargs $(java-config -j) cf ${MY_P}.jar || die "Failed to build package"
}

src_install() {
	java-pkg_dojar ${MY_P}.jar
	dodoc Jama/ChangeLog
	use source && java-pkg_dosrc Jama
	use doc && dohtml -r Jama/doc/*
}
