# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="CLX reimplementation on XCB/Xlib"
HOMEPAGE="https://github.com/rpav/cl-xcb-xlib"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/cl-xcb-xlib.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/bordeaux-threads
dev-lisp/trivial-garbage
dev-lisp/static-vectors
!dev-lisp/clx"

