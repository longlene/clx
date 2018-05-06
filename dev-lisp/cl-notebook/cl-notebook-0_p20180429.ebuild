# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2e693f1f6ef0eb375b13d23aaca25ed929836493"

DESCRIPTION="A python notebook-esque thing for Common Lisp"
HOMEPAGE="https://github.com/Inaimathi/cl-notebook"
SRC_URI="https://github.com/Inaimathi/cl-notebook/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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

