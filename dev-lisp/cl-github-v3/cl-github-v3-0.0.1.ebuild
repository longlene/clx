# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Common Lisp interface to the github V3 API"
HOMEPAGE="https://github.com/hanshuebner/cl-github-v3"
SRC_URI="https://github.com/hanshuebner/cl-github-v3/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/drakma
dev-lisp/yason
dev-lisp/alexandria"

