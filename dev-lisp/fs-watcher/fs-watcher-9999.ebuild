# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Watches for filesystem changes"
HOMEPAGE="https://github.com/Ralt/fs-watcher"

EGIT_REPO_URI="https://github.com/Ralt/fs-watcher.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/monkeylib-pathnames"
