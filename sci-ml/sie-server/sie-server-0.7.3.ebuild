# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1

DESCRIPTION="Search Inference Engine - GPU inference server for search workloads"
HOMEPAGE="https://github.com/superlinked/sie"
SRC_URI="https://github.com/superlinked/sie/archive/refs/tags/v${PV}.tar.gz -> sie-${PV}.gh.tar.gz"
S="${WORKDIR}/sie-${PV}/packages/sie_server"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gpu-metrics tui xformers"

RDEPEND="
	>=sci-ml/pytorch-2.9[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/pytorch-2.10[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/transformers-6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.20[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/tokenizers-1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.26[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/huggingface_hub-2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/sentence-transformers-5.0[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/sentence-transformers-6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.19[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/peft-1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/timm-0.9[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/timm-1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.18[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/torchvision-1[${PYTHON_SINGLE_USEDEP}]
	gpu-metrics? ( >=dev-python/nvidia-ml-py-13.5[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		dev-python/sie-sdk[storage,${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.32[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.2.1[${PYTHON_USEDEP}]
		>=dev-python/msgpack-numpy-0.4[${PYTHON_USEDEP}]
		>=dev-python/orjson-3.10[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32[${PYTHON_USEDEP}]
		>=dev-python/flagembedding-1.3[${PYTHON_USEDEP}]
		>=dev-python/einops-0.8[${PYTHON_USEDEP}]
		>=dev-python/gliner-0.2[${PYTHON_USEDEP}]
		>=dev-python/gliner2-1.3.1[${PYTHON_USEDEP}]
		>=dev-python/glirel-1.0[${PYTHON_USEDEP}]
		>=dev-python/gliclass-0.1[${PYTHON_USEDEP}]
		>=dev-python/docling-2.99[${PYTHON_USEDEP}]
		<dev-python/docling-2.100[${PYTHON_USEDEP}]
		media-libs/opencv[python,${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7[${PYTHON_USEDEP}]
		>=sci-ml/open-clip-torch-2.24[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.9[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.6[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/watchdog-6[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.28[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.28[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-fastapi-0.49_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-1.28[${PYTHON_USEDEP}]
		>=dev-python/typer-0.14[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		>=dev-python/uvloop-0.22[${PYTHON_USEDEP}]
		>=dev-python/msgspec-0.20.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
		>=dev-python/blake3-0.4[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.20[${PYTHON_USEDEP}]
		xformers? ( >=sci-ml/xformers-0.0.30[${PYTHON_USEDEP}] )
		tui? ( >=dev-python/textual-3.0[${PYTHON_USEDEP}] )
	')
"
