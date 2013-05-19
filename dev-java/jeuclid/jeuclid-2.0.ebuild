# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils java-pkg

DESCRIPTION="MathML to SVG for GIF converter"
SRC_URI="mirror://sourceforge/jeuclid/${P}.tar.gz"
HOMEPAGE="http://jeuclid.sourceforge.net/"
LICENSE="jeuclid"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86 ~ppc"
DEPEND=">=virtual/jre-1.4"

IUSE="doc jikes"

src_compile() {
        local antflags="package"
        use doc && antflags="${antflags} javadoc"
        use jikes && antflags="${antflags} -Dbuild.compiler=jikes"
        ant ${antflags} || die "compile failed"
}
src_install() {
        java-pkg_newjar build/jars/${P}.jar ${PN}.jar
        use doc && java-pkg_dohtml -r build/docs
}
