# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils autotools

DESCRIPTION="ManKai Common Lisp"
HOMEPAGE="http://common-lisp.net/project/mkcl/"
SRC_URI="http://common-lisp.net/project/mkcl/releases/mkcl-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/gmp
virtual/libffi
dev-libs/boehm-gc
dev-lisp/asdf"
RDEPEND="${DEPEND}"


src_prepare() {
	epatch "${FILESDIR}"/mkcl-1.1.4-funtoo-fixes.patch
}

src_configure() {
	econf --prefix=/usr 
}
