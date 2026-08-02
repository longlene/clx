# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="GPU-accelerated robot learning and sim-to-real transfer library"
HOMEPAGE="https://github.com/google-deepmind/mujoco_playground"
SRC_URI="https://github.com/google-deepmind/mujoco_playground/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/mujoco_playground-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="learning"
RESTRICT="test"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	sci-ml/brax[${PYTHON_USEDEP}]
	dev-python/etils[${PYTHON_USEDEP}]
	dev-python/flax[${PYTHON_USEDEP}]
	dev-python/jax[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/mediapy[${PYTHON_USEDEP}]
	dev-python/ml-collections[${PYTHON_USEDEP}]
	>=sci-libs/mujoco-3.6.0[python,${PYTHON_USEDEP}]
	dev-python/orbax-checkpoint[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/warp-lang[${PYTHON_USEDEP}]
	learning? (
		dev-python/rsl-rl-lib[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
	)
"
