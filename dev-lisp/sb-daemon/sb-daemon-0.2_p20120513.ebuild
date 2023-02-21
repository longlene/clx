# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6e9804fcb365fdf45de091d337757416c940821c"

DESCRIPTION="Process daemonization for SBCL"
HOMEPAGE="https://github.com/nikodemus/sb-daemon"
SRC_URI="https://github.com/nikodemus/sb-daemon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/sbcl
"

