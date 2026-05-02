# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Context-Aware RAG library for Knowledge Graph ingestion and retrieval functions"
HOMEPAGE="
	https://pypi.org/project/context-aware-rag/
	https://github.com/NVIDIA/context-aware-rag
"
SRC_URI="https://github.com/NVIDIA/context-aware-rag/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pymilvus-model-0.3.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.9.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/nvidia-rag-2.2.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/openai-1.109.1[${PYTHON_USEDEP}]
		>=sci-ml/langchain-core-0.3.80[${PYTHON_USEDEP}]
		>=sci-ml/langchain-0.3.27[${PYTHON_USEDEP}]
		>=sci-ml/langchain-community-0.3.31[${PYTHON_USEDEP}]
		>=sci-ml/langchain-milvus-0.2.1[${PYTHON_USEDEP}]
		>=sci-ml/langchain-openai-0.3.35[${PYTHON_USEDEP}]
		>=sci-ml/langchain-experimental-0.3.4[${PYTHON_USEDEP}]
		>=sci-ml/langchain-nvidia-ai-endpoints-0.3.19[${PYTHON_USEDEP}]
		>=dev-python/pymilvus-2.5.14[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/protobuf-6.33.2[${PYTHON_USEDEP}]
		>=dev-python/redis-5.2.1[${PYTHON_USEDEP}]
		>=dev-python/unstructured-0.18.21[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.32.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.5[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.22.0[${PYTHON_USEDEP}]
		>=dev-python/schema-0.7.8[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.30.2[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.39.1[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.39.1[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-http-1.39.1[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-fastapi-0.60.0[${PYTHON_USEDEP}]
		>=dev-python/nvtx-0.2.11[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.9.4[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.4[${PYTHON_USEDEP}]
		>=dev-python/minio-7.2.15[${PYTHON_USEDEP}]
		>=dev-python/pyaml-env-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/bleach-6.2.0[${PYTHON_USEDEP}]
		>=dev-python/dataclass-wizard-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/pdfplumber-0.11.8[${PYTHON_USEDEP}]
		>=sci-ml/openinference-semantic-conventions-0.1.25[${PYTHON_USEDEP}]
		>=sci-ml/openinference-instrumentation-openai-0.1.41[${PYTHON_USEDEP}]
		>=sci-ml/openinference-instrumentation-langchain-0.1.56[${PYTHON_USEDEP}]
		>=dev-python/neo4j-5.24.0[${PYTHON_USEDEP}]
		>=dev-python/fastmcp-2.13.0.2[${PYTHON_USEDEP}]
		>=sci-ml/langgraph-1.0.1[${PYTHON_USEDEP}]
		>=sci-ml/langchain-elasticsearch-0.4.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.12.0.88[${PYTHON_USEDEP}]
		>=dev-python/numba-0.61.2[${PYTHON_USEDEP}]
		>=dev-python/llvmlite-0.44.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
