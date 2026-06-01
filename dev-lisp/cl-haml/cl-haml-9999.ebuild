# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Haml like XHTML generator"
HOMEPAGE="https://github.com/Publitechs/cl-haml"

EGIT_REPO_URI="https://github.com/Publitechs/cl-haml.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cl-who"
