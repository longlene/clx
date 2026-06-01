# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Simple date/time manipulation for CL"
HOMEPAGE="https://github.com/ury-marshak/trivial-datetime"

EGIT_REPO_URI="git@github.com:ury-marshak/trivial-datetime.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
