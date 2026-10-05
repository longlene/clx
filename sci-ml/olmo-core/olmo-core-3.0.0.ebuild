# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Core training module for the Open Language Model (OLMo)"
HOMEPAGE="
	https://github.com/allenai/OLMo-core
	https://olmo-core.readthedocs.io/en/latest/
"
SRC_URI="https://github.com/allenai/OLMo-core/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/Olmo-core-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=sci-ml/pytorch-2.10.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/cached-path-1.7.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/bettermap[${PYTHON_USEDEP}]
		>=dev-python/dataclass-extensions-0.3.0[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/importlib-resources[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
	')
"

# The test suite is not hermetic: the distributed tests spawn processes on
# the GLOO backend (which the system's CUDA pytorch build does not provide),
# the io tests hit real S3/GCS buckets, and the nn/hf tests download gated
# HuggingFace models (google/gemma-3-270m) requiring an HF token. Upstream
# CI runs them with a CPU torch build plus AWS/GCS/HF secrets.
RESTRICT="test"
