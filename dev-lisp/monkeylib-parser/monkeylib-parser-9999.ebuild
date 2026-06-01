# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Parser generator"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-parser"

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-parser.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

CLSYSTEMS="com.gigamonkeys.parser"

RDEPEND="${DEPEND}
dev-lisp/monkeylib-macro-utilities
dev-lisp/monkeylib-utilities"
