# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A gradient processing and optimization library in JAX"
HOMEPAGE="
	https://github.com/google-deepmind/optax
	https://optax.readthedocs.io
	https://pypi.org/project/optax/
"
SRC_URI="https://github.com/google-deepmind/optax/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/jax[${PYTHON_USEDEP}]
	dev-python/jaxlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
