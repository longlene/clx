# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="HTML generation on top of monkeylib-text-languages"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-html"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-html.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/monkeylib-macro-utilities
dev-lisp/monkeylib-test-framework
dev-lisp/monkeylib-pathnames
dev-lisp/monkeylib-utilities
dev-lisp/monkeylib-text-output
dev-lisp/monkeylib-text-language"
