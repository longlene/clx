# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A modern RAG ingestion pipeline from Nvidia"
HOMEPAGE="
	https://github.com/NVIDIA/NeMo-Retriever
"
SRC_URI="https://github.com/NVIDIA/NeMo-Retriever/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/Nemo-Retriever-${PV}/nemo_retriever
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/ray-2.49.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
	>=dev-python/sqlglot-30.0.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.114.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.6.3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.0[${PYTHON_USEDEP}]
	>=dev-python/universal-pathlib-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.8.0[${PYTHON_USEDEP}]
	sci-ml/nv-ingest-api[${PYTHON_USEDEP}]
	sci-ml/nv-ingest-client[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-4.30.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-12.1.1[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.9.3[${PYTHON_USEDEP}]
	dev-python/markitdown[${PYTHON_USEDEP}]
	>=sci-ml/langchain-nvidia-ai-endpoints-0.3.0[${PYTHON_USEDEP}]
	dev-python/lancedb[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
