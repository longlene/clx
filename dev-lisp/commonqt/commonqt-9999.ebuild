# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2
DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="git://gitorious.org/commonqt/commonqt.git"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
kde-base/smokeqt
dev-lisp/trivial-features
dev-lisp/cffi
dev-lisp/named-readtables
dev-lisp/cl-ppcre
dev-lisp/alexandria
dev-lisp/closer-mop
dev-lisp/iterate
dev-lisp/trivial-garbage
dev-lisp/bordeaux-threads"

