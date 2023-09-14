EAPI=8

JAVA_PKG_IUSE="doc"

inherit versionator java-pkg-2 multilib

MY_P="${PN}-${PV}"

DESCRIPTION="Java wrapper including a basic JDBC driver for SQLite database engine"
HOMEPAGE="http://www.ch-werner.de/javasqlite/"
SRC_URI="http://www.ch-werner.de/javasqlite/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEP="
	dev-db/sqlite
	"
RDEPEND="${COMMON_DEP}
	>=virtual/jre-1.6"
DEPEND="${COMMON_DEP}
	>=virtual/jdk-1.6
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	java-pkg-2_pkg_setup
}

src_configure() {
	./configure prefix=/usr --with-sqlite=no --enable-load-extension
}

src_compile() {
	emake
	use doc && DISPLAY= emake javadoc
}

src_install(){
	emake -j1  DESTDIR="${D}" install || die
	java-pkg_regjar /usr/share/java/sqlite.jar

	use doc && java-pkg_dojavadoc doc
}
