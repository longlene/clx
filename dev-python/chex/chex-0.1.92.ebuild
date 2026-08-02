# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Testing made fun, in JAX!"
HOMEPAGE="https://github.com/google-deepmind/chex"
SRC_URI="https://github.com/google-deepmind/chex/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/absl-py-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24.1[${PYTHON_USEDEP}]
	>=dev-python/toolz-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/jax-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.7.0[${PYTHON_USEDEP}]
"
