# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4908a84c16349929b309c50409815ff81fb9b3c4"

DESCRIPTION="A bridge between Common Lisp and GObject"
HOMEPAGE="https://github.com/andy128k/cl-gobject-introspection"
SRC_URI="https://github.com/andy128k/cl-gobject-introspection/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/iterate
	dev-lisp/trivial-garbage
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd test
}

