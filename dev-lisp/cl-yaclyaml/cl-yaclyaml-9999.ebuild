# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Yet Another Common Lisp YaML processor"
HOMEPAGE="https://github.com/mabragor/cl-yaclyaml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mabragor/cl-yaclyaml.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/rutils
dev-lisp/cl-test-more
dev-lisp/cl-interpol
dev-lisp/esrap
dev-lisp/alexandria
dev-lisp/yaclanapht
dev-lisp/cl-ppcre
dev-lisp/demacro-enhance
dev-lisp/parse-number"

