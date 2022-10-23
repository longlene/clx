# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="84711388e9399e3cf18c865b456e4099a903651f"

DESCRIPTION="Common Lisp interface to MongoDB"
HOMEPAGE="http://fons.github.com/cl-mongo"
SRC_URI="https://github.com/muyinliu/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uuid
	dev-lisp/babel
	dev-lisp/bordeaux-threads
	dev-lisp/documentation-template
	dev-lisp/lisp-unit
	dev-lisp/parenscript
	dev-lisp/split-sequence
	dev-lisp/usocket
"

