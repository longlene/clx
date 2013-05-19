# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Some java libary"
HOMEPAGE="http://simpleweb.sourceforge.net/"

SRC_URI="mirror://sourceforge/simpleweb/${P}.tar.gz"
LICENSE="GPL-2 BSD"
SLOT="0"
KEYWORDS="~x86"

IUSE="source doc"

RDEPEND=">=virtual/jre-1.5
	>=dev-java/groovy-1.0_beta4
	>=dev-java/ant-core-1.6.2
	>=dev-java/freemarker-2.3.0
	>=dev-java/velocity-1.4
	>=dev-java/kxml-2.0"

DEPEND=">=virtual/jdk-1.5
	${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	rm lib/*
	cd lib/
	java-pkg_jar-from ant-core
	java-pkg_jar-from groovy-1
	java-pkg_jar-from freemarker-2.3 
	java-pkg_jar-from velocity 
	java-pkg_jar-from kxml-2
}

src_compile() {
	eant $(use_doc javadoc) 
}

src_install() {
	java-pkg_newjar jar/${P}.jar
	use source && java-pkg_dosrc src/*
	use doc && java-pkg_dohtml -r javadocs/*
}

