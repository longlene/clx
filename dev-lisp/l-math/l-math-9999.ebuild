# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Mathematics for geometric applications"
HOMEPAGE="https://github.com/TheRiver/L-MATH"

EGIT_REPO_URI="https://github.com/TheRiver/L-MATH.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
