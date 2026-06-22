# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A reference solution for a foundational Retrieval Augmented Generation (RAG)"
HOMEPAGE="
	https://pypi.org/project/nvidia-rag/
	https://github.com/NVIDIA-AI-Blueprints/rag
"
SRC_URI="https://github.com/NVIDIA-AI-Blueprints/rag/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/rag-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pymilvus-model-0.3[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/bleach-6.2[${PYTHON_USEDEP}]
		>=dev-python/dataclass-wizard-0.27[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.5[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.12.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
		>=dev-python/httpx-sse-0.4.3[${PYTHON_USEDEP}]
		>=sci-ml/langchain-1.2.7[${PYTHON_USEDEP}]
		>=sci-ml/langchain-community-0.4[${PYTHON_USEDEP}]
		>=sci-ml/langchain-milvus-0.3.0[${PYTHON_USEDEP}]
		>=sci-ml/langchain-nvidia-ai-endpoints-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/minio-7.2[${PYTHON_USEDEP}]
		>=dev-python/pdfplumber-0.11.9[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11[${PYTHON_USEDEP}]
		>=dev-python/pymilvus-2.6.7[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.22[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.32[${PYTHON_USEDEP}]
		>=sci-ml/langchain-core-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/redis-4.3.4[${PYTHON_USEDEP}]
		>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
		>=dev-python/lark-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)
