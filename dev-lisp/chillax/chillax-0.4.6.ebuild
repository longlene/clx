# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="CouchDB abstraction layer for Common Lisp"
HOMEPAGE="https://github.com/zkat/chillax"
SRC_URI="https://github.com/zkat/chillax/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/flexi-streams
	dev-lisp/drakma
	dev-lisp/jsown
	dev-lisp/yason
"

