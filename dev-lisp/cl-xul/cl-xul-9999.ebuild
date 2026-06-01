# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Mozilla XUL bindings for Common Lisp"
HOMEPAGE="http://mmontone.github.io/cl-xul"

EGIT_REPO_URI="https://github.com/mmontone/cl-xul.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

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
