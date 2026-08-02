# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python actor framework for heterogeneous computing"
HOMEPAGE="https://github.com/xorbitsai/xoscar"
SRC_URI="https://github.com/xorbitsai/xoscar/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${P}/python"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/tblib[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/cython-0.29.33[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"

src_prepare() {
	# Skip the C++ collective (gloo/pygloo) CMake extension —
	# submodules are not included in the GitHub archive tarball.
	sed -i 's|ext_modules=extensions + \[XoscarCmakeExtension("xoscar_pygloo")\]|ext_modules=extensions|' \
		setup.py || die
	# Use standard build_ext so Cython extensions land in the correct build dir.
	sed -i 's|"build_ext": CMakeBuild|"build_ext": build_ext|' \
		setup.py || die
	distutils-r1_src_prepare
}

distutils_enable_tests pytest
