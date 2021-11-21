# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="08fe484105eec87fe50805282c61578bbd1143e4"

DESCRIPTION="Lisp binding to the GTK+-3"
HOMEPAGE="http://gitorious.org/lisp-projects/cl-gtk"
SRC_URI="https://github.com/crategus/cl-cffi-gtk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
	dev-lisp/closer-mop
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/iterate
	x11-libs/gtk+:3
	x11-libs/pango
	x11-libs/cairo
"

src_prepare() {
	use example || rm -rf demo tutorial
	use test || rm -rf test
}

