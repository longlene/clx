# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="A Common Lisp library for making simple websites quickly"
HOMEPAGE="http://lisperator.net/sytes/ https://github.com/mishoo/sytes"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mishoo/sytes.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="sbcl"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/hunchentoot
dev-lisp/anaphora
dev-lisp/parse-number
dev-lisp/cl-ppcre
dev-lisp/cl-unicode
dev-lisp/split-sequence
dev-lisp/cl-fad
dev-lisp/bordeaux-threads
dev-lisp/trivial-utf8
dev-lisp/closer-mop
sbcl? ( dev-lisp/sb-daemon )"

