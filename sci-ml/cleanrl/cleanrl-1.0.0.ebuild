# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Single-file Deep RL algorithm implementations with research-friendly features"
HOMEPAGE="https://github.com/vwxyzjn/cleanrl https://docs.cleanrl.dev"
SRC_URI="https://github.com/vwxyzjn/cleanrl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	sci-ml/stable-baselines3[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/docker[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/seaborn[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		sci-ml/gym[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	# Allow building with Python >= 3.10
	sed -i 's/python = ">=3.7.1,<3.10"/python = ">=3.7.1"/' pyproject.toml || die
	# distutils.util.strtobool was removed in Python 3.12
	sed -i 's/from distutils.util import strtobool/strtobool = lambda v: v.lower() in ("y","yes","t","true","on","1")/' \
		cleanrl_utils/benchmark.py || die
	distutils-r1_src_prepare
}
