# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

FLASH_ATTENTION_COMMIT="720c94869cf2e0ff5a706e9c7f1dce0939686ade"

DESCRIPTION="A high-throughput and memory-efficient inference and serving engine for LLMs"
HOMEPAGE="
	https://docs.vllm.ai/
	https://pypi.org/project/vllm/
"
SRC_URI="
	https://github.com/vllm-project/vllm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/vllm-project/flash-attention/archive/${FLASH_ATTENTION_COMMIT}.tar.gz -> flash-attention-${FLASH_ATTENTION_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm"
REQUIRED_USE="|| ( cuda rocm )"

RDEPEND="
	>=sci-libs/caffe2-2.5.1[cuda?,rocm?,${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/transformers-4.48.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/tokenizers-0.19.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/tiktoken-0.6.0[${PYTHON_SINGLE_USEDEP}]
	cuda? (
		>=dev-libs/cutlass-3.7.0
	)
	$(python_gen_cond_dep '
		sci-libs/sentencepiece[python,${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/blake3[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		>=dev-python/openai-1.52.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.9[${PYTHON_USEDEP}]
		>=dev-python/prometheus_client-0.18.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		>=dev-python/prometheus-fastapi-instrumentator-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/lm-format-enforcer-0.10.9[${PYTHON_USEDEP}]
		>=dev-python/outlines-0.1.11[${PYTHON_USEDEP}]
		>=dev-python/lark-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/xgrammar-0.1.11[${PYTHON_USEDEP}]
		>=dev-python/typing_extensions-4.10[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
		dev-python/partial-json-parser[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		>=dev-python/gguf-0.10.0[${PYTHON_USEDEP}]
		dev-python/importlib_metadata[${PYTHON_USEDEP}]
		>=dev-python/mistral_common-1.5.0[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		>=dev-python/compressed-tensors-0.9.1[${PYTHON_USEDEP}]
		>=dev-python/depyf-0.18.0[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

src_prepare() {
	eapply "${FILESDIR}"/system-cutlass.patch
	distutils-r1_src_prepare
}

src_configure() {
	local target_device="cpu"
	if use cuda ; then
		target_device="cuda"
	elif use rocm ; then
		target_device="rocm"
	fi
	export VLLM_TARGET_DEVICE="${target_device}"
	export VLLM_FLASH_ATTN_SRC_DIR="${WORKDIR}"/flash-attention-${FLASH_ATTENTION_COMMIT}
	distutils-r1_src_configure
}

