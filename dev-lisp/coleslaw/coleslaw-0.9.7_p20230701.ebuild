# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cc0271b319b6df7b3d09653ec0cf0773600cd19c"

DESCRIPTION="Flexible Lisp Blogware"
HOMEPAGE="https://github.com/kingcons/coleslaw"
SRC_URI="https://github.com/kingcons/coleslaw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-closure-template
	dev-lisp/3bmd
	dev-lisp/alexandria
	dev-lisp/local-time
	dev-lisp/inferior-shell
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/cl-unicode
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r tests ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all themes
}
