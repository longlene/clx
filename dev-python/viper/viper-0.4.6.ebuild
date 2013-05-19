EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Minimalistic scientific plotter and run-time visualization module"
HOMEPAGE="http://www.fenics.org/wiki/Viper"
SRC_URI="http://launchpad.net/fenics-${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="|| ( LGPL-2.1 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"
