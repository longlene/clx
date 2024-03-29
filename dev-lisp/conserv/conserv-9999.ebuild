# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Conserv is an event-based networking library"
HOMEPAGE="https://github.com/sykopomp/conserv"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sykopomp/conserv.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iolib
dev-lisp/babel
dev-lisp/trivial-gray-streams
dev-lisp/alexandria
dev-lisp/cl-ppcre"

