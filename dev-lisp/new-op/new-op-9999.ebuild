# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A new operator for Common Lisp"
HOMEPAGE="http://common-lisp.net/project/new-op/index.html"

EGIT_REPO_URI="git://common-lisp.net/projects/new-op/new-op.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
