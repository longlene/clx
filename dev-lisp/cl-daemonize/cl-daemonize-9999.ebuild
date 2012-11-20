# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2
DESCRIPTION="A tool to daemonize a Lisp process without the need for screen/detachtty."
HOMEPAGE="https://github.com/mishoo/cl-daemonize"
SRC_URI=""

EGIT_REPO_URI="git://github.com/mishoo/cl-daemonize.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-fad
dev-lisp/cffi
dev-lisp/trivial-backtrace
app-emacs/slime"

