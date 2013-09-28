# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp bindings for Freetype 2"
HOMEPAGE="https://github.com/rpav/cl-freetype2"
SRC_URI="https://github.com/rpav/cl-freetype2/archive/${PV}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cffi
dev-lisp/trivial-garbage"

