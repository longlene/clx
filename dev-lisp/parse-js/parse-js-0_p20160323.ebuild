# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fbadc6029bec7039602abfc06c73bb52970998f6"

DESCRIPTION="A JavaScript parser in Common Lisp"
HOMEPAGE="http://marijnhaverbeke.nl/parse-js/"
SRC_URI="https://github.com/marijnh/parse-js/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

