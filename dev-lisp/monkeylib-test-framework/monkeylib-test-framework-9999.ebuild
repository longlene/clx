# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Simple unit test framework for Common Lisp"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-test-framework"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-test-framework.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

CLSYSTEMS="com.gigamonkeys.test-framework"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/monkeylib-macro-utilities"

