# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A web crawling framework in Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/arachne"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/arachne.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/drakma
dev-lisp/plump
dev-lisp/clss
dev-lisp/xpath
dev-lisp/cxml-stp
dev-lisp/trivial-types
dev-lisp/local-time
dev-lisp/cl-mop
test? ( dev-lisp/fiveam dev-lisp/lucerne )
"
src_install() {
	common-lisp-install-sources src
	common-lisp-install-sources -t all README.md
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf ${PN}-test.asd

	fi
}

