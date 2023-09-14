# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b1a3c876305baa0dead419841de7b3e433a75867"

DESCRIPTION="Trivial portability for raw *nix IO in Common Lisp"
HOMEPAGE="https://github.com/kingcons/trivial-raw-io"
SRC_URI="https://github.com/kingcons/trivial-raw-io/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"

