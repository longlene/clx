# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Massively parallel rigidbody physics simulation on accelerator hardware"
HOMEPAGE="https://github.com/google/brax"
SRC_URI="https://github.com/google/brax/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/etils[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-cors[${PYTHON_USEDEP}]
	dev-python/flax[${PYTHON_USEDEP}]
	>=dev-python/jax-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.4.6[${PYTHON_USEDEP}]
	dev-python/jaxopt[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/ml-collections[${PYTHON_USEDEP}]
	sci-libs/mujoco[python,${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/optax[${PYTHON_USEDEP}]
	>=dev-python/orbax-checkpoint-0.11.22[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/tensorboardx[${PYTHON_USEDEP}]
	dev-python/trimesh[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
