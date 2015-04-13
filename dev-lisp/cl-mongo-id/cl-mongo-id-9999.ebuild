# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="MongoDB ObjectId generator/parser for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-mongo-id"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-mongo-id.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/md5
dev-lisp/bordeaux-threads
dev-lisp/local-time"

