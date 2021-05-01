# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="827e737062b4873ecf86c255649d44aca4b4f48f"

DESCRIPTION="Blogging in Lisp"
HOMEPAGE="https://github.com/billstclair/Lisplog"
SRC_URI="https://github.com/billstclair/Lisplog/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fsdb
	dev-lisp/cl-crypto
	dev-lisp/md5
	dev-lisp/anaphora
	dev-lisp/html-template
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/bordeaux-threads
	dev-lisp/hunchentoot
	dev-lisp/limited-thread-taskmaster
	dev-lisp/cl-base64
	dev-lisp/cl-smtp
	dev-lisp/xmls
	dev-lisp/drakma
"

