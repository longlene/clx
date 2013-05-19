NEED_PYTHON=2.4

inherit distutils

DESCRIPTION="Parsing and manipulating FLV files"
HOMEPAGE="http://wulczer.org/"
SRC_URI="http://wulczer.org/flvlib/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc64 ~s390 ~x86"

src_install() {
	distutils_src_install
}
