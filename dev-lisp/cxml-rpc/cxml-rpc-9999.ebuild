# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="An xml-rpc library for Common Lisp"
HOMEPAGE="https://github.com/antifuchs/cxml-rpc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/antifuchs/cxml-rpc.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cxml
dev-lisp/cl-base64
dev-lisp/drakma
dev-lisp/hunchentoot
dev-lisp/parse-number"

