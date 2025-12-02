# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Library to facilitate the use of state-of-the-art retrieval models in common RAG contexts"
HOMEPAGE="
	https://pypi.org/project/RAGatouille/
"
SRC_URI="https://github.com/AnswerDotAI/RAGatouille/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-libs/llama-index[${PYTHON_USEDEP}]
	sci-libs/faiss-cpu[${PYTHON_USEDEP}]
	sci-libs/langchain_core[${PYTHON_USEDEP}]
	>=sci-libs/colbert-ai-0.2.19[${PYTHON_USEDEP}]
	sci-libs/langchain[${PYTHON_USEDEP}]
	sci-libs/onnx[${PYTHON_USEDEP}]
	sci-libs/srsly[${PYTHON_USEDEP}]
	sci-libs/voyager[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-1.13[${PYTHON_USEDEP}]
	sci-libs/fast-pytorch-kmeans[${PYTHON_USEDEP}]
	sci-libs/sentence-transformers[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
