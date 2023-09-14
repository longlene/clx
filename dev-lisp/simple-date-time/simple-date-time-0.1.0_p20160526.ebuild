# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d6992afddedf67a8172a0120a1deac32afcaa2e8"

DESCRIPTION="date and time library for common lisp"
HOMEPAGE="https://github.com/quek/simple-date-time"
SRC_URI="https://github.com/quek/simple-date-time/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
"

