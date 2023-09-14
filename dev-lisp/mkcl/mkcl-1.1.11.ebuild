# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="ManKai Common Lisp"
HOMEPAGE="http://common-lisp.net/project/mkcl/"
SRC_URI="https://github.com/jcbeaudoin/MKCL/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
#KEYWORDS="~x86 ~amd64"
IUSE="debug gengc threads +unicode"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/gmp
virtual/libffi
dev-lisp/asdf"

src_prepare() {
	#	epatch "${FILESDIR}"/mkcl-1.1.4-funtoo-fixes.patch
	:
}

src_configure() {
	econf --prefix=/usr \
		--with-system-gmp \
		--enable-longdouble \
		--enable-c99complex \
		$(use_enable gengc) \
		$(use_enable debug) \
		$(use_enable threads) \
		$(use_with threads __thread) \
		$(use_enable unicode) \
		$(use_with X x) \
		$(use_with X clx)
}

src_compile() {
	emake -j1 || die
}

src_install() {
	einstall mkcldir="${ED}/usr/$(get_libdir)/${P}" || die
}
