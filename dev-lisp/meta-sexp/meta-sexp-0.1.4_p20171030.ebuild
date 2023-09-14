# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="95199ec4a74be4e5bef563b5e740930ee6c65741"

DESCRIPTION="A META parser generator using LL(1) grammars with s-expressions"
HOMEPAGE="https://github.com/vy/meta-sexp"
SRC_URI="https://github.com/vy/meta-sexp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

