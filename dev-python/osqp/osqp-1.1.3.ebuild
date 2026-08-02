# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

OSQP_C_VER="1.0.0"
QDLDL_VER="0.1.8"

DESCRIPTION="OSQP: The Operator Splitting QP Solver"
HOMEPAGE="https://osqp.org"
SRC_URI+="
	https://github.com/osqp/osqp/archive/refs/tags/v${OSQP_C_VER}.tar.gz -> osqp-c-${OSQP_C_VER}.gh.tar.gz
	https://github.com/osqp/qdldl/archive/refs/tags/v${QDLDL_VER}.tar.gz -> qdldl-${QDLDL_VER}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pybind11-2.13[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_configure_all() {
	export SKBUILD_CMAKE_ARGS="-DFETCHCONTENT_FULLY_DISCONNECTED=ON;-DFETCHCONTENT_SOURCE_DIR_OSQP=${WORKDIR}/osqp-${OSQP_C_VER};-DFETCHCONTENT_SOURCE_DIR_QDLDL=${WORKDIR}/qdldl-${QDLDL_VER}"
}
