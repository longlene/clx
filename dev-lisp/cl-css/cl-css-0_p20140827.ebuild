# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8fe654c8f0cf95b300718101cce4feb517f78e2f"

DESCRIPTION="Simple inline CSS generator for Common Lisp"
HOMEPAGE="https://github.com/Inaimathi/cl-css"
SRC_URI="https://github.com/Inaimathi/cl-css/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

