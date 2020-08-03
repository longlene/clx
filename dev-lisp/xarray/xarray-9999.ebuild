# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="A generalized interface for array-like objects with views"
HOMEPAGE="https://github.com/blindglobe/xarray"
SRC_URI=""

EGIT_REPO_URI="https://github.com/blindglobe/xarray.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-utilities
dev-lisp/iterate
dev-lisp/metabang-bind
dev-lisp/anaphora"

