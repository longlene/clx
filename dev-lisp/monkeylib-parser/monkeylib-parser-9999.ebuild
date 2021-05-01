# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Parser generator"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-parser"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-parser.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

CLSYSTEMS="com.gigamonkeys.parser"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/monkeylib-macro-utilities
dev-lisp/monkeylib-utilities"

