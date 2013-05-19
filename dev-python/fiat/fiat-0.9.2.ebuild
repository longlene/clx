EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Generation of arbitrary order instances of the Lagrange elements on lines, triangles, and tetrahedra"
HOMEPAGE="http://www.fenics.org/wiki/FIAT"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="dev-python/scientificpython"
RESTRICT_PYTHON_ABIS="3.*"
