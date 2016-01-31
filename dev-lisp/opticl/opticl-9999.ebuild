# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A library for representing and processing images"
HOMEPAGE="https://github.com/slyrus/opticl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/slyrus/opticl.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
"
