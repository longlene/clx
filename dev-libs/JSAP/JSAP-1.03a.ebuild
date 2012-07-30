# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Java Simple Arguments Parser (JSAP)"
HOMEPAGE="http://sourceforge.net/projects/jsap"
SRC_URI="http://puzzle.dl.sourceforge.net/sourceforge/jsap/${P}-src.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

# FIXME: get minimal version possible
DEPEND="=virtual/jdk-1.4 
        ${RDEPEND}
        >=dev-java/ant-core-1.5.4
        =dev-java/snip-0.11
		=dev-java/rundoc-0.11"

RDEPEND=">=virtual/jre-1.4"

src_unpack()
{
	unpack ${A}

	cd ${S}/lib

	rm ant.jar
	java-pkg_jar-from --build-only snip snip.jar snip-0.11.jar
	java-pkg_jar-from --build-only rundoc rundoc.jar rundoc-0.11.jar
	java-pkg_jar-from --build-only junit junit.jar 
}

src_compile()
{	
	eant clean jar $(use_doc) $(use_doc manual)
}

src_install()
{
	java-pkg_newjar dist/JSAP_1.03a.jar ${PN}.jar

	use doc && java-pkg_dohtml -r doc
}
