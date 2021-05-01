# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="554b981f0e0208936bf2648848aa43aa15818a2e"

DESCRIPTION="Common Lisp interface to the memcached object caching system"
HOMEPAGE="https://github.com/quasi/cl-memcached"
SRC_URI="https://github.com/quasi/cl-memcached/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/split-sequence
	dev-lisp/babel
	dev-lisp/pooler
"

