# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3
DESCRIPTION="The Common Lisp wiki"
HOMEPAGE="http://cliki.net/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/vsedach/cliki2.git"
LICENSE="AGPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/hunchentoot
dev-lisp/bordeaux-threads
dev-lisp/ironclad
dev-lisp/colorize
dev-lisp/cl-sanitize
dev-lisp/diff
dev-lisp/cl-interpol
dev-lisp/uri-template
dev-lisp/flexi-streams
dev-lisp/cl-ppcre
dev-lisp/cl-smtp
dev-lisp/cl-smtp
dev-lisp/cl-fad
dev-lisp/anaphora
dev-lisp/stem
dev-lisp/osicat"

