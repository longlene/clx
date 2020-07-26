# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Compiler for text-based languages"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-text-languages.git"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-text-languages.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/monkeylib-text-output
dev-lisp/monkeylib-macro-utilities"

