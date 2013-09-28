# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp library for interacting with Oracle via OCILIB"
HOMEPAGE="https://github.com/archimag/cl-oracle"
SRC_URI=""

EGIT_REPO_URI="https://github.com/archimag/cl-oracle.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iterate
dev-lisp/parse-number"

