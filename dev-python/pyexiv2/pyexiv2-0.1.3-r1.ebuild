DESCRIPTION="pyexiv2, a python binding to exiv2"
HOMEPAGE="http://tilloy.net/dev/pyexiv2/"
SRC_URI="http://tilloy.net/dev/pyexiv2/releases/${PN}-${PV}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
DEPEND="dev-lang/python
	dev-util/scons
	>=media-gfx/exiv2-0.19
	dev-libs/boost"
RDEPEND="${DEPEND}"

inherit eutils

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/r1727-findmetadatumbyid.patch
}

src_compile() {
	scons
}

src_install() {
	scons DESTDIR="${D}" install
	dodoc ${S}/README
}
