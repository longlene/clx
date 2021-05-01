# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Loosely-coupled collection of audio libraries in Common Lisp"
HOMEPAGE="https://github.com/ahefner/mixalot"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ahefner/mixalot.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/bordeaux-threads
dev-lisp/alexandria"

