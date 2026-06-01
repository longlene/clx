# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An asynchronous version of drakma that runs off of cl-async"
HOMEPAGE="https://github.com/orthecreedence/drakma-async"

EGIT_REPO_URI="https://github.com/orthecreedence/drakma-async.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/drakma
dev-lisp/cl-async
dev-lisp/flexi-streams"
