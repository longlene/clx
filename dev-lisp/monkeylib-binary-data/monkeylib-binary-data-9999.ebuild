# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Library for reading and writing binary data"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-binary-data"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-binary-data.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CLSYSTEMS="com.gigamonkeys.parser"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria"

