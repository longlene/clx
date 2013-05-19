EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Domain specific language for declaration of finite element discretizations of variational forms"
HOMEPAGE="http://www.fenics.org/wiki/UFL"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"
