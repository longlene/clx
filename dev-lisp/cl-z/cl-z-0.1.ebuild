# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Common Lisp wrapper of ZLib compression library"
HOMEPAGE="https://github.com/andy128k/cl-z"
SRC_URI="https://github.com/andy128k/cl-z/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
sys-libs/zlib"

