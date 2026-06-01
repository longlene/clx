# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A set of dynamic index data structures for spatially-extended data"
HOMEPAGE="https://github.com/rpav/spatial-trees"

EGIT_REPO_URI="https://github.com/rpav/spatial-trees.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
