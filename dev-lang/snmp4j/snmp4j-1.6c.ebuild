# dev-java/snmp4j-1.6c.ebuild

inherit java-pkg

DESCRIPTION="Object Oriented SNMP Implementation for Java"
SRC_URI="http://www.snmp4j.org/${P}.zip"
HOMEPAGE="http://www.snmp4j.org"
LICENSE="Apache-2"
SLOT="0"
KEYWORDS="x86 amd64 ppc64 sparc ppc"
IUSE="doc source jikes"

DEPEND=">=virtual/jdk-1.4.1
	dev-java/ant-core
	jikes? ( dev-java/jikes )
	source? ( app-arch/zip )"

S="${WORKDIR}/snmp4j"

src_unpack() {
	unpack ${A}
	cd ${S}
	rm -rf dist/
}

src_compile() {
	local antflags="archive"
	use jikes && antflags="${antflags} -Dbuild.compiler=jikes"
	ant ${antflags} || die "compilation error"
}

src_install() {
	java-pkg_newjar dist/lib/SNMP4J.jar ${PN}.jar

	use doc && java-pkg_dohtml -r doc/*
	use source && java-pkg_dosrc src/*
}

