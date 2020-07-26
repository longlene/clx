# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="A PNG decoder for Common Lisp"
HOMEPAGE="https://github.com/Ramarren/png-read"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Ramarren/png-read.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/chipz
dev-lisp/babel"

