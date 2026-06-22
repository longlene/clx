# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

FLASH_ATTENTION_COMMIT="dd62dac706b1cf7895bd99b18c6cb7e7e117ee25"
FLASHMLA_COMMIT="a6ec2ba7bd0a7dff98b3f4d3e6b52b159c48d78b"
TRITON_PV="3.5.1"
DEEPGEMM_COMMIT="891d57b4db1071624b5c8fa0d1e51cb317fa709f"
QUTLASS_COMMIT="830d2c4537c7396e14a02a46fbddd18b5d107c65"

DESCRIPTION="A high-throughput and memory-efficient inference and serving engine for LLMs"
HOMEPAGE="
	https://docs.vllm.ai/
	https://pypi.org/project/vllm/
"
SRC_URI="
	https://github.com/vllm-project/vllm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/vllm-project/flash-attention/archive/${FLASH_ATTENTION_COMMIT}.tar.gz -> flash-attention-${FLASH_ATTENTION_COMMIT}.tar.gz
	https://github.com/vllm-project/FlashMLA/archive/${FLASHMLA_COMMIT}.tar.gz -> flashmla-${FLASHMLA_COMMIT}.tar.gz
	https://github.com/triton-lang/triton/archive/refs/tags/v${TRITON_PV}.tar.gz -> triton-${TRITON_PV}.gh.tar.gz
	https://github.com/deepseek-ai/DeepGEMM/archive/${DEEPGEMM_COMMIT}.tar.gz -> DeepGEMM-${DEEPGEMM_COMMIT}.tar.gz
	https://github.com/IST-DASLab/qutlass/archive/${QUTLASS_COMMIT}.tar.gz -> qutlass-${QUTLASS_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+cuda rocm"
REQUIRED_USE="|| ( cuda rocm )"

RDEPEND="
	>=sci-ml/transformers-4.56.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.21.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/caffe2-2.6.0[cuda?,rocm?,${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/xgrammar-0.2.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/compressed-tensors-0.15.0.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/outlines-core-0.2.14[${PYTHON_SINGLE_USEDEP}]
	cuda? (
		>=dev-libs/cutlass-3.9.0
	)
	$(python_gen_cond_dep '
		|| (
			sci-ml/pysentencepiece[${PYTHON_USEDEP}]
			sci-ml/sentencepiece[python(-),${PYTHON_USEDEP}]
		)
		>=dev-python/tiktoken-0.6.0[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/blake3[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		>=dev-python/protobuf-5.29.6[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.13.3[${PYTHON_USEDEP}]
		>=dev-python/openai-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-client-0.18.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		>=dev-python/prometheus-fastapi-instrumentator-7.0.0[${PYTHON_USEDEP}]
		>=sci-ml/lm-format-enforcer-0.11.3[${PYTHON_USEDEP}]
		>=sci-ml/llguidance-1.7.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.6.2[${PYTHON_USEDEP}]
		dev-python/diskcache[${PYTHON_USEDEP}]
		>=dev-python/lark-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.10[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
		dev-python/partial-json-parser[${PYTHON_USEDEP}]
		>=dev-python/pyzmq-25.0.0[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		>=dev-python/mistral-common-1.11.2[${PYTHON_USEDEP}]
		>=dev-python/gguf-0.17.0[${PYTHON_USEDEP}]
		media-libs/opencv[python,${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		>=dev-python/depyf-0.20.0[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/watchfiles[${PYTHON_USEDEP}]
		dev-python/python-json-logger[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/pybase64[${PYTHON_USEDEP}]
		dev-python/cbor2[${PYTHON_USEDEP}]
		dev-python/ijson[${PYTHON_USEDEP}]
		dev-python/setproctitle[${PYTHON_USEDEP}]
		dev-python/anthropic[${PYTHON_USEDEP}]
		dev-python/openai-harmony[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.27.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.27.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-1.27.0[${PYTHON_USEDEP}]
	')
"
# TODO: package dev-python/opentelemetry-semantic-conventions-ai (>=0.4.1, new in 0.22.1)
# TODO: package dev-python/model-hosting-container-standards (>=0.1.14,<1.0.0, new in 0.22.1)
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

src_prepare() {
	eapply \
		"${FILESDIR}"/system-cutlass.patch
	pushd "${WORKDIR}"/flash-attention-${FLASH_ATTENTION_COMMIT} || die
	eapply "${FILESDIR}"/flash-attention-python314-compat.patch
	eapply "${FILESDIR}"/flash-attention-cutlass4-compat.patch
	popd || die
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
	export TRITON_KERNELS_SRC_DIR="${WORKDIR}"/triton-${TRITON_PV}/python/triton_kernels/triton_kernels
	export DEEPGEMM_SRC_DIR="${WORKDIR}"/DeepGEMM-${DEEPGEMM_COMMIT}
	export QUTLASS_SRC_DIR="${WORKDIR}"/qutlass-${QUTLASS_COMMIT}
	export CMAKE_ARGS="-DMKL_THREADING=gnu_thread"
	distutils-r1_src_configure
}
