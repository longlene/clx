# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Pure lisp crypto"
HOMEPAGE="https://github.com/billstclair/cl-crypto"
SRC_URI="mirror://github/billstclair/cl-crypto/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-base64
dev-lisp/flexi-streams
dev-lisp/anaphora"

