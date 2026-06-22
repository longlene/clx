# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Library for building speculative decoding algorithms for LLM inference"
HOMEPAGE="https://docs.vllm.ai/projects/speculators https://github.com/vllm-project/speculators"
SRC_URI="https://github.com/vllm-project/speculators/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.9.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.56.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
		>=dev-python/openai-2.0[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.0[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.3[${PYTHON_USEDEP}]
		>=dev-python/typer-0.12[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	# Write version files since there is no git repo at build time
	echo "${PV}" > src/speculators/version.txt || die
	cat > src/speculators/version.py <<-EOF || die
		version = "${PV}"
		build_type = "release"
		build_iteration = "0"
		git_commit = ""
		git_branch = ""
		git_last_tag = "v${PV}"
	EOF

	# Replace git-based version setup with a static version
	cat > setup.py <<-EOF || die
		from setuptools import setup
		setup(version="${PV}")
	EOF

	# Remove setuptools-git-versioning build requirement
	sed -i 's|"setuptools-git-versioning>=2.0,<3",||' pyproject.toml || die

	distutils-r1_src_prepare
}
