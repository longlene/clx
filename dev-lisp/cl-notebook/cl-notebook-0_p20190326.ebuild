# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5fdb5b6208fe2b5b13248b9cd034c839c26ddd94"

DESCRIPTION="A python notebook-esque thing for Common Lisp"
HOMEPAGE="https://github.com/inaimathi/cl-notebook"
SRC_URI="https://github.com/inaimathi/cl-notebook/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/house
	dev-lisp/fact-base
	dev-lisp/parenscript
	dev-lisp/cl-fad
	dev-lisp/cl-who
	dev-lisp/cl-css
	dev-lisp/closer-mop
"

