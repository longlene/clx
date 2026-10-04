# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Deep learning framework for AI-driven multi-physics systems"
HOMEPAGE="
	https://github.com/NVIDIA/physicsnemo
	https://docs.nvidia.com/physicsnemo/index.html
"
SRC_URI="https://github.com/NVIDIA/physicsnemo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/einops-0.8.1[${PYTHON_USEDEP}]
		>=dev-python/h5py-3.15.1[${PYTHON_USEDEP}]
		>=dev-python/cftime-1.6.5[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2026.4.0[${PYTHON_USEDEP}]
		>=dev-python/gitpython-3.1.49[${PYTHON_USEDEP}]
		>=dev-python/hydra-core-1.3.2[${PYTHON_USEDEP}]
		>=dev-python/importlib-metadata-8.7.1[${PYTHON_USEDEP}]
		>=dev-python/jaxtyping-0.3.3[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.22.4[${PYTHON_USEDEP}]
		>=dev-python/nvtx-0.2.10[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
		>=dev-python/s3fs-2023.5.0[${PYTHON_USEDEP}]
		>=dev-python/termcolor-3.2.0[${PYTHON_USEDEP}]
		>=sci-ml/timm-1.0.22[${PYTHON_SINGLE_USEDEP}]
		>=dev-python/tqdm-4.60.0[${PYTHON_USEDEP}]
		>=dev-python/warp-lang-1.14.0[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.7.0[${PYTHON_USEDEP}]
		>=sci-ml/onnx-1.14.0[${PYTHON_USEDEP}]
		>=sci-ml/pytorch-2.10.0[${PYTHON_SINGLE_USEDEP}]
		>=sci-ml/torchvision-0.25.0[${PYTHON_SINGLE_USEDEP}]
	')
"

# tensordict is python-single-r1 in the tree, so match the single target
RDEPEND+="
	>=sci-ml/tensordict-0.14.0[${PYTHON_SINGLE_USEDEP}]
"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatchling[${PYTHON_USEDEP}]
	')
"
