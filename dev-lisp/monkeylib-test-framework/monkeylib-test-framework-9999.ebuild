# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Simple unit test framework for Common Lisp"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-test-framework"

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-test-framework.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

CLSYSTEMS="com.gigamonkeys.test-framework"

RDEPEND="${DEPEND}
dev-lisp/monkeylib-macro-utilities"
