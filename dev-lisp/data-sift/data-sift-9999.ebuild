# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp library for validataion and transformation of string data"
HOMEPAGE="https://github.com/archimag/data-sift"
SRC_URI=""

EGIT_REPO_URI="https://github.com/archimag/data-sift.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/parse-number
dev-lisp/alexandria
dev-lisp/puri"

