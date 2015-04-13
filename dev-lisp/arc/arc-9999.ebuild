# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="An implementation of Arc in SBCL"
HOMEPAGE="https://github.com/pauek/arc-sbcl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/pauek/arc-sbcl.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-fad
dev-lisp/sbcl"

