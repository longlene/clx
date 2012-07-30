# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="A java based MMO game engion"
HOMEPAGE="http://arianne.sourceforge.net/"

SRC_URI="mirror://sourceforge/arianne/${P}-src.tar.gz"
LICENSE="GPL-2 BSD"
SLOT="0"
KEYWORDS="~x86"

IUSE="source doc"

RDEPEND=">=virtual/jre-1.5
	>=dev-java/log4j-1.2.8
	>=dev-java/jnlp-bin-1.2"

DEPEND=">=virtual/jdk-1.5
	${RDEPEND}
	>=dev-java/ant-1.6.2"

src_unpack() {
	unpack ${A}
	cd ${S}
	mkdir -p libs || die "Unable to create libs dir"
	cd libs
	java-pkg_jar-from log4j
	java-pkg_jar-from jnlp-bin
}

src_compile() {
	eant clean
	eant $(use_doc docs) jar
}

src_install() {
	java-pkg_newjar lib/${P}.jar
	use source && java-pkg_dosrc src/*
	use doc && java-pkg_dohtml -r javadocs/*
	dodoc AUTHORS LICENSE README
}
