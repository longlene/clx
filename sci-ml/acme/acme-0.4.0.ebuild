# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A library of reinforcement learning components and agents"
HOMEPAGE="https://github.com/google-deepmind/acme"
SRC_URI="https://github.com/google-deepmind/acme/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="jax tf"
RESTRICT="test"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/dm-env[${PYTHON_USEDEP}]
	dev-python/dm-tree[${PYTHON_USEDEP}]
	sci-ml/launchpad[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	jax? (
		dev-python/chex[${PYTHON_USEDEP}]
		dev-python/jax[${PYTHON_USEDEP}]
		dev-python/flax[${PYTHON_USEDEP}]
		sci-ml/haiku[${PYTHON_USEDEP}]
		dev-python/optax[${PYTHON_USEDEP}]
		dev-python/rlax[${PYTHON_USEDEP}]
		sci-ml/reverb[${PYTHON_USEDEP}]
		sci-ml/tensorflow[${PYTHON_USEDEP}]
		sci-ml/tensorflow-probability[${PYTHON_USEDEP}]
	)
	tf? (
		sci-ml/reverb[${PYTHON_USEDEP}]
		sci-ml/sonnet[${PYTHON_USEDEP}]
		sci-ml/tensorflow[${PYTHON_USEDEP}]
		sci-ml/tensorflow-probability[${PYTHON_USEDEP}]
		dev-python/trfl[${PYTHON_USEDEP}]
	)
"
