# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="CL-INOTIFY - Interface to the Linux inotify(7) API."
HOMEPAGE="https://github.com/Ferada/cl-inotify"
SRC_URI=""

EGIT_REPO_URI="git://github.com/Ferada/cl-inotify.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/binary-types
dev-lisp/cffi
dev-lisp/trivial-utf8"

