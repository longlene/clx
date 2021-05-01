# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A lisp browser using WebKit"
HOMEPAGE="http://lispkit.org"
SRC_URI=""

EGIT_REPO_URI="https://github.com/AeroNotix/lispkit.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-cffi-gtk
	dev-lisp/cl-ppcre
	dev-lisp/cl-webkit
	dev-lisp/cl-xkeysym
	dev-lisp/djula
	dev-lisp/lparallel
	dev-lisp/parenscript
	dev-lisp/purl
	dev-lisp/split-sequence
	test? ( dev-lisp/prove )
"

src_prepare() {
	use test || rm -rf test lispkit-test.asd
}
