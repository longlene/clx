# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A common-lisp library providing python style generators"
HOMEPAGE="https://github.com/AccelerationNet/generators"

EGIT_REPO_URI="https://github.com/AccelerationNet/generators.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cl-cont
dev-lisp/alexandria
dev-lisp/iterate"
