# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="21cb57f2595faa26d687893963f24ec41822b63c"

DESCRIPTION="Common Lisp compiler for the strftime language"
HOMEPAGE="https://github.com/ruricolist/cl-strftime"
SRC_URI="https://github.com/ruricolist/cl-strftime/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:cl-strftime\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
