# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Formatted text output"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-text-output/"

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-text-output.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/monkeylib-macro-utilities
dev-lisp/monkeylib-test-framework
dev-lisp/monkeylib-pathnames
dev-lisp/monkeylib-utilities"
