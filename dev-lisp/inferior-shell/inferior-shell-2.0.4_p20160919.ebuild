# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e1f6378d75cea9eed243a793efa90cec55e401cb"

DESCRIPTION="Spawn local or remote processes and shell pipes from Lisp."
HOMEPAGE="http://common-lisp.net/gitweb?p=projects/qitab/inferior-shell.git"
SRC_URI="https://github.com/fare/inferior-shell/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/fare-quasiquote
	dev-lisp/fare-mop
	dev-lisp/fare-utils
	dev-lisp/optima
	dev-lisp/stefil
"

