# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="An LLM post-training framework for RL Scaling"
HOMEPAGE="
	https://pypi.org/project/slime/
	https://github.com/THUDM/slime
"
SRC_URI="https://github.com/THUDM/slime/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/blobfile[${PYTHON_USEDEP}]
	')
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/memray[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pylatexenc[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		sci-ml/qwen-vl-utils[${PYTHON_USEDEP}]
		dev-python/ray[${PYTHON_USEDEP}]
		sci-ml/ring-flash-attn[${PYTHON_USEDEP}]
	')
	>=sci-ml/sglang-router-0.2.3[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/wandb[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
