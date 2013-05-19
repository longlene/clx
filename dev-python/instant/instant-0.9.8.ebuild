EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Instant inlining of C and C++ code in Python"
HOMEPAGE="http://www.fenics.org/wiki/Instant"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="|| ( LGPL-2.1 BSD )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"
