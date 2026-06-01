# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Ultimate POSIX-Shell Integration for Steel Bank Common Lisp"
HOMEPAGE="https://github.com/thephoeron/uber-shell"

EGIT_REPO_URI="https://github.com/thephoeron/uber-shell.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cl-fad"
