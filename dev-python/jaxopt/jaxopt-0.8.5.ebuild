# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Hardware accelerated, batchable and differentiable optimizers in JAX"
HOMEPAGE="https://github.com/google/jaxopt"
SRC_URI="https://github.com/google/jaxopt/archive/refs/tags/jaxopt-v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/jaxopt-jaxopt-v${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/jax-0.2.18[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.1.69[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18.4[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.0.0[${PYTHON_USEDEP}]
"
