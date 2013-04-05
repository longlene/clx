# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A few standard macro-writing macros"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-macro-utilities"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-macro-utilities.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CLSYSTEMS="com.gigamonkeys.macro-utilities"

DEPEND=""
RDEPEND="${DEPEND}"

