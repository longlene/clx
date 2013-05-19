inherit distutils

DESCRIPTION="NCrypt is a python wrapper for OpenSSL built using Pyrex."
HOMEPAGE="http://tachyon.in/ncrypt/"
SRC_URI="http://tachyon.in/ncrypt/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
PYTHON_MODNAME="ncrypt"


DEPEND="dev-python/pyrex
	dev-libs/openssl"

src_compile() {
	python setup.py build
}

src_install() {
	distutils_src_install
}

