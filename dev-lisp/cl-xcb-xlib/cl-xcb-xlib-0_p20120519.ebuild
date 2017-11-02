# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b00c44d4723b3a8334f36e731906d4679341c0e"

DESCRIPTION="CLX reimplementation on XCB/Xlib"
HOMEPAGE="https://github.com/rpav/cl-xcb-xlib"
SRC_URI="https://github.com/rpav/cl-xcb-xlib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-garbage
	dev-lisp/static-vectors
"

