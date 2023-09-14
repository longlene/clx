# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="962c2f982df23a5aab6206d6105d4f86fe43fecc"

DESCRIPTION="Leak *LEXENV* variable from compilation into runtime"
HOMEPAGE="https://github.com/mabragor/cl-curlex"
SRC_URI="https://github.com/mabragor/cl-curlex/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/eos
	dev-lisp/iterate"

