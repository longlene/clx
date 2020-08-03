# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="sb-daemon: Process daemonization for SBCL."
HOMEPAGE="https://github.com/nikodemus/sb-daemon"
SRC_URI=""

EGIT_REPO_URI="git://github.com/nikodemus/sb-daemon.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/sbcl"

