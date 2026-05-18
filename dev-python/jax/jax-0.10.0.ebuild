# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )
inherit distutils-r1

DESCRIPTION="Differentiate, compile, and transform Numpy code"
HOMEPAGE="
	https://github.com/jax-ml/jax
	https://docs.jax.dev/
"
SRC_URI="https://github.com/jax-ml/jax/archive/refs/tags/jax-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/jaxlib-${PV}[${PYTHON_USEDEP}]
	>=dev-python/ml-dtypes-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	dev-python/opt-einsum[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/pytest )
"

distutils_enable_tests pytest

S="${WORKDIR}"/jax-jax-v${PV}

src_prepare() {
	rm -rf docs
	distutils-r1_src_prepare
}
