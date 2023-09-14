# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="QR code 2005 encoder in Common Lisp"
HOMEPAGE="https://github.com/jnjcc/cl-qrencode"
SRC_URI="https://github.com/jnjcc/cl-qrencode/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/zpng"

