EAPI="3"
#SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Quality triangular and tetrahedral mesh generation for Python"
HOMEPAGE="http://mathema.tician.de/software/meshpy http://pypi.python.org/pypi/MeshPy"
SRC_URI="http://pypi.python.org/packages/source/M/MeshPy/MeshPy-0.91.2.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools"
RDEPEND="dev-libs/boost[python]"

S="${WORKDIR}/MeshPy-${PV}"

src_configure() {
	./configure.py --boost-python-libname="boost_python-mt"
}
