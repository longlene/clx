# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Uniform Manifold Approximation and Projection"
HOMEPAGE="
	https://github.com/lmcinnes/umap
	https://pypi.org/project/umap-learn/
"
SRC_URI="https://github.com/lmcinnes/umap/archive/refs/tags/release-${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-0.22[${PYTHON_USEDEP}]
	>=dev-python/numba-0.51.2[${PYTHON_USEDEP}]
	>=dev-python/pynndescent-0.5[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/umap-release-${PV}
