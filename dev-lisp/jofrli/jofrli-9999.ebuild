# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="URL shortener"
HOMEPAGE="https://github.com/antifuchs/jofrli"
SRC_URI=""

EGIT_REPO_URI="https://github.com/antifuchs/jofrli.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/lredis
dev-lisp/hunchentoot
dev-lisp/md5
dev-lisp/alexandria
dev-lisp/puri
dev-lisp/uuid
dev-lisp/cl-who
dev-lisp/idna"

