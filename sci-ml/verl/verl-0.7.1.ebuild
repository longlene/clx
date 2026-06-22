# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Flexible and efficient RL post-training framework for LLMs"
HOMEPAGE="https://verl.readthedocs.io/en/latest/ https://github.com/verl-project/verl https://pypi.org/project/verl/"
SRC_URI="https://github.com/verl-project/verl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# NOTE: codetiming is not yet packaged in Gentoo/overlay; ray[default] extras map to
# optional ray plugins (dashboard etc.) which are handled upstream without USE flags.
# tensordict>=0.8.0,<=0.10.0 is upstream constraint; overlay ships 0.12.2 which may work.
RDEPEND="
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/peft[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensordict[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchdata[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/dill[${PYTHON_USEDEP}]
		dev-python/hydra-core[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-19.0.0[${PYTHON_USEDEP}]
		dev-python/pylatexenc[${PYTHON_USEDEP}]
		dev-python/pybind11[${PYTHON_USEDEP}]
		>=dev-python/ray-2.41.0[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
	')
"

python_prepare_all() {
	# Exclude tests/ and scripts/ from installed packages — they are stray
	# top-level directories that the upstream find_packages() picks up.
	sed -i \
		's|find_packages(where="\.")|find_packages(where=".", exclude=["tests", "tests.*", "scripts", "scripts.*"])|' \
		setup.py || die
	distutils-r1_python_prepare_all
}
