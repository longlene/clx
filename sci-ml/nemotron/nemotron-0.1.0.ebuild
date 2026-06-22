# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Developer Asset Hub for NVIDIA Nemotron"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Nemotron
	https://docs.nvidia.com/nemotron/latest/index.html
"
SRC_URI="https://github.com/NVIDIA-NeMo/Nemotron/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/Nemotron-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/nemo-run-0.4.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.20.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.14.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.36.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
		>=dev-python/textual-0.70.0[${PYTHON_USEDEP}]
		>=dev-python/ray-2.49.2[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2024.0.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}]
		>=dev-python/xxhash-3.4.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/tomlkit-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.23.1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.12.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
