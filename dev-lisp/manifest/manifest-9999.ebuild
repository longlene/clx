# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="System for semi-automatically documenting Common Lisp packages"
HOMEPAGE="https://github.com/gigamonkey/manifest"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/manifest.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/closer-mop
dev-lisp/toot
dev-lisp/puri
dev-lisp/split-sequence
dev-lisp/monkeylib-html"

