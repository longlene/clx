# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="808914a75ea52539a124cc9df729a5296fb37ad4"

DESCRIPTION="C to Common Lisp compiler"
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

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all libc/*.{c,h}
}
