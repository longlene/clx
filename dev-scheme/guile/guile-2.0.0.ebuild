EAPI=3

DESCRIPTION="Interpreter and compiler for the Scheme Programming Language"
HOMEPAGE="http://www.gnu.org/software/guile/"
SRC_URI="ftp://ftp.gnu.org/pub/gnu/guile/${P}.tar.gz"

KEYWORDS="x86 amd64"
SLOT="12"
MAJOR="2.0"
LICENSE="LGPL-3"
IUSE="debug-malloc debug +networking +regex +deprecated nls"

DEPEND="
	dev-libs/gmp
	sys-devel/libtool
	sys-devel/gettext
	dev-libs/boehm-gc
	dev-libs/libunistring
	dev-libs/libffi"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable debug-malloc) \
		$(use_enable debug guile-debug) \
		$(use_enable networking) \
		$(use_enable regex) \
		$(use_enable deprecated) \
		$(use_enable nls)
}

src_compile() {
	emake || die "make failed"
}

src_install () {
	einstall || die "install failed"
}

