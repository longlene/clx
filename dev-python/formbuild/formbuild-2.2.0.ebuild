
EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="FormBuild"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Build forms quickly and easily using groups of simple helper functions."
HOMEPAGE="http://formbuild.org/ http://pypi.python.org/pypi/FormBuild"
SRC_URI="http://cheeseshop.python.org/packages/source/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="amd64 ~ia64 ppc ~sparc x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE="doc test"

DEPEND="dev-python/setuptools
	test? ( dev-python/nose )"
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}/${MY_P}"


src_test() {
	testing() {
		PYTHONPATH="build-${PYTHON_ABI}/lib" LC_ALL="C" nosetests-${PYTHON_ABI}
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc; then
		cd "${S}"
		dodoc docs/*.txt

		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
