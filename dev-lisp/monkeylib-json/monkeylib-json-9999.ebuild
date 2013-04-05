# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Library for reading and writing JSON-formatted data"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-json"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-json.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CLSYSTEMS="com.gigamonkeys.json"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/monkeylib-parser
dev-lisp/monkeylib-utilities"

