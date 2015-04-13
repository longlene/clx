# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Peter Seibel's collection of 'utilities'"
HOMEPAGE="Peter Seibel's collection of 'utilities'"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-utilities.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

CLSYSTEMS="com.gigamonkeys.utilities"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/split-sequence"

