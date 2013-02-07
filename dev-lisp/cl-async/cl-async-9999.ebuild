# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Asynchronous operations for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-async"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-async.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-libevent2
dev-lisp/cl-ppcre
dev-lisp/trivial-features
dev-lisp/babel
dev-lisp/trivial-gray-streams
virtual/puri"

