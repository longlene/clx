# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="A simple thread-safe binary heap implementation for Common Lisp"
HOMEPAGE="https://github.com/nikodemus/pileup http://nikodemus.github.com/pileup/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nikodemus/pileup.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria"
#* may need sbcl*

