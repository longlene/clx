# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Peter Seibel's collection of 'utilities'"
HOMEPAGE="Peter Seibel's collection of 'utilities'"

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-utilities.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

CLSYSTEMS="com.gigamonkeys.utilities"

RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/split-sequence"
