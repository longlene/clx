# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Libevent2 bindings for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-libevent2"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-libevent2.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi"

