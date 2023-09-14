# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A Common lisp library providing collector macros"
HOMEPAGE="https://github.com/AccelerationNet/collectors"
SRC_URI=""

EGIT_REPO_URI="https://github.com/AccelerationNet/collectors.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria"

