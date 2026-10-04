# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1

DESCRIPTION="A modern RAG ingestion pipeline from Nvidia"
HOMEPAGE="
	https://github.com/NVIDIA/NeMo-Retriever
"
SRC_URI="https://github.com/NVIDIA/NeMo-Retriever/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/NeMo-Retriever-${PV}/nemo_retriever"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/ray-2.56.1[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
	>=dev-python/sqlglot-30.0.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.114.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
	>=dev-python/prometheus-fastapi-instrumentator-8.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.41.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.41.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.41.1[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.0[${PYTHON_USEDEP}]
	>=dev-python/universal-pathlib-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.8.0[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
	dev-python/ffmpeg-python[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2025.5.1[${PYTHON_USEDEP}]
	>=dev-python/s3fs-2025.5.1[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-4.30.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-12.3.0[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.10.3[${PYTHON_USEDEP}]
	dev-python/markitdown[${PYTHON_USEDEP}]
	>=sci-ml/langchain-nvidia-ai-endpoints-1.4.0[${PYTHON_USEDEP}]
	dev-python/lancedb[${PYTHON_USEDEP}]
	>=dev-python/nvidia-riva-client-2.25.1[${PYTHON_USEDEP}]
	>=sci-ml/tokenizers-0.23.1[${PYTHON_USEDEP}]
	>=sci-ml/huggingface_hub-0.34.0[${PYTHON_USEDEP}]
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	')
"

python_compile() {
	RETRIEVER_VERSION="${PV}" \
	RETRIEVER_RELEASE_TYPE=release \
	RETRIEVER_BUILD_NUMBER=0 \
		distutils-r1_python_compile
}

distutils_enable_tests pytest
