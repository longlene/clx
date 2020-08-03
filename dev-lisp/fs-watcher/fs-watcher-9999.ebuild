# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Watches for filesystem changes"
HOMEPAGE="https://github.com/Ralt/fs-watcher"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Ralt/fs-watcher.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/monkeylib-pathnames"

