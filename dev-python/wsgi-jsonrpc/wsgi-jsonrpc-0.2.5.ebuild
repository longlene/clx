# Distributed under the terms of the GNU General Public License v2

NEED_PYTHON=2.5

inherit distutils

KEYWORDS="~amd64 ~x86"

DESCRIPTION="WSGI jsonrpc application"
HOMEPAGE="http://code.google.com/p/wsgi-jsonrpc/"
SRC_URI="http://cheeseshop.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

src_install() {
	distutils_src_install
}

