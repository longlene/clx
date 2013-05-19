# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:


inherit java-pkg

DESCRIPTION="A framework (library) for the IRC Protocol, written entirely in Java, for Java programs."
HOMEPAGE="http://martyr.sourceforge.net"
SRC_URI="mirror://sourceforge/martyr/${P}.tar.gz"


LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="x86 ppc sparc amd64 ppc64"
IUSE="doc examples jikes source"

B="${WORKDIR}/${P}/${C}/build"
DEPEND=">=virtual/jdk-1.3
        >=dev-java/ant-core-1.4
        jikes? ( >=dev-java/jikes-1.17 )
        source? ( app-arch/zip )"
RDEPEND=">=virtual/jdk-1.3"

src_compile() {
        cd ${WORKDIR}/${P}
        local antflags="jar"
        use doc && antflags="${antflags} javadocs"
        use jikes && antflags="${antflags} -Dbuild.compiler=jikes"
        ant ${antflags} || die "Failed Creating Docs"
}

src_install() {
        java-pkg_dojar ${PN}.jar ||die "install failed jar not found!"

        if use doc; then
                dodoc LICENSE README
                java-pkg_dohtml *.html
                java-pkg_dohtml -r docs/
        fi
        use source && java-pkg_dosrc src/java/org
}

