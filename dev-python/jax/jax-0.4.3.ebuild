# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="Differentiate, compile, and transform Numpy code"
HOMEPAGE="https://github.com/google/jax"
SRC_URI="https://github.com/google/jax/archive/refs/tags/jax-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}]
	dev-python/jaxlib[${PYTHON_USEDEP}]
	dev-python/opt_einsum[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.5[${PYTHON_USEDEP}]
	dev-python/typing_extensions[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/pytest )
"

distutils_enable_tests pytest

S="${WORKDIR}"/jax-jax-v${PV}
