# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Haml like XHTML generator"
HOMEPAGE="https://github.com/Publitechs/cl-haml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Publitechs/cl-haml.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-who"

