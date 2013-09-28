# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Redis client for Common Lisp"
HOMEPAGE="https://github.com/vseloved/cl-redis"
SRC_URI="https://github.com/vseloved/cl-redis/archive/${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-db/redis
dev-lisp/rutils
dev-lisp/cl-ppcre
dev-lisp/usocket
dev-lisp/flexi-streams
dev-lisp/nuts"

