# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

FLASH_ATTENTION_COMMIT="8798f27777fb57f447070301bf33a9f9c607f491"
FLASHMLA_COMMIT="575f7724b9762f265bbee5889df9c7d630801845"

DESCRIPTION="A high-throughput and memory-efficient inference and serving engine for LLMs"
HOMEPAGE="
	https://docs.vllm.ai/
	https://pypi.org/project/vllm/
"
SRC_URI="
	https://github.com/vllm-project/vllm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/vllm-project/flash-attention/archive/${FLASH_ATTENTION_COMMIT}.tar.gz -> flash-attention-${FLASH_ATTENTION_COMMIT}.tar.gz
	https://github.com/vllm-project/FlashMLA/archive/${FLASHMLA_COMMIT}.tar.gz -> flashmla-${FLASHMLA_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm"
REQUIRED_USE="|| ( cuda rocm )"

RDEPEND="
	>=sci-ml/transformers-4.48.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.19.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/caffe2-2.6.0[cuda?,rocm?,${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/xgrammar-0.1.16[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/compressed-tensors-0.9.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/outlines-0.1.11[${PYTHON_SINGLE_USEDEP}]
	cuda? (
		>=dev-libs/cutlass-3.9.0
	)
	$(python_gen_cond_dep '
		|| (
			sci-ml/pysentencepiece[${PYTHON_USEDEP}]
			sci-ml/sentencepiece[python,${PYTHON_USEDEP}]
		)
		>=dev-python/tiktoken-0.6.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/blake3[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		>=dev-python/openai-1.52.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.9[${PYTHON_USEDEP}]
		>=dev-python/prometheus-client-0.18.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		>=dev-python/prometheus-fastapi-instrumentator-7.0.0[${PYTHON_USEDEP}]
		>=sci-ml/lm-format-enforcer-0.10.11[${PYTHON_USEDEP}]
		>=dev-python/lark-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.10[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
		dev-python/partial-json-parser[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		>=dev-python/gguf-0.10.0[${PYTHON_USEDEP}]
		dev-python/importlib-metadata[${PYTHON_USEDEP}]
		>=dev-python/mistral-common-1.5.4[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		>=dev-python/depyf-0.18.0[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/watchfiles[${PYTHON_USEDEP}]
		dev-python/python-json-logger[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
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
	eapply \
		"${FILESDIR}"/system-cuda.patch \
		"${FILESDIR}"/system-cutlass.patch \
		"${FILESDIR}"/system-python.patch
	sed -e 's#\("3.12"\))#\1 "3.13")#' \
		-i "${WORKDIR}"/flash-attention-${FLASH_ATTENTION_COMMIT}/CMakeLists.txt
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
	export FLASH_MLA_SRC_DIR="${WORKDIR}"/FlashMLA-${FLASHMLA_COMMIT}
	distutils-r1_src_configure
}

