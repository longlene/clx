# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="zsort is a collection of portable sorting algorithms in Common Lisp"
HOMEPAGE="https://github.com/jorgetavares/zsort"

EGIT_REPO_URI="https://github.com/jorgetavares/zsort.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/alexandria"
