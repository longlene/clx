# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Mozilla XUL bindings for Common Lisp"
HOMEPAGE="http://mmontone.github.io/cl-xul"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mmontone/cl-xul.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/log5
dev-lisp/cl-fad
dev-lisp/parenscript
dev-lisp/cxml
dev-lisp/closer-mop
dev-lisp/cl-json
dev-lisp/md5
|| ( net-libs/xulrunner-bin net-libs/xulrunner )"


