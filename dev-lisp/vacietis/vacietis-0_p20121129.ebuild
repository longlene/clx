# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="50c1b82a9f906c270cd8cbc7a1fe7f7281ebad2f"

DESCRIPTION="A C compiler for Common Lisp systems"
HOMEPAGE="https://github.com/vsedach/Vacietis"
SRC_URI="https://github.com/vsedach/Vacietis/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
	dev-lisp/anaphora
	dev-lisp/babel
	dev-lisp/cl-ppcre
	dev-lisp/cl-fad
	dev-lisp/trivial-dump-core
"

