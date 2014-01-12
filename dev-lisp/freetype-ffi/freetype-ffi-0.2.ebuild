# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="FFI bindings to the freetype2 font library"
HOMEPAGE="http://cyrusharmon.org/projects?project=freetype-ffi"
SRC_URI="http://cyrusharmon.org/static/releases/freetype-ffi_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/xmls
dev-lisp/gcc-xml-ffi
media-libs/freetype"

src_prepare() {
	epatch "${FILESDIR}/${P}-funtoo-fixes.patch"
	if ! use test; then
		rm -r test *test*.*
	fi
}

