# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="A crawler in lisp"
HOMEPAGE="https://github.com/vikram/cl-crawler"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vikram/cl-crawler.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/md5
dev-lisp/uffi
dev-lisp/cl-html-parse
dev-lisp/drakma
dev-lisp/gzip-stream
dev-lisp/cl-muproc
dev-lisp/hunchentoot
dev-lisp/cl-who
dev-lisp/json
dev-lisp/closure-html
dev-lisp/cxml-stp
dev-lisp/split-sequence
dev-lisp/acl-compat
dev-lisp/s-http-client
dev-lisp/ironclad
dev-lisp/fiveam"

