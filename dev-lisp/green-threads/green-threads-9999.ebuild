# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A lightweight thread / cooperative multitasking library for Common Lisp"
HOMEPAGE="https://github.com/deliciousrobots/green-threads"
SRC_URI=""

EGIT_REPO_URI="https://github.com/deliciousrobots/green-threads.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-cont
dev-lisp/cl-async-future"

