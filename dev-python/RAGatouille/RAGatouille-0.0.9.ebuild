# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Library to facilitate the use of state-of-the-art retrieval models in common RAG contexts"
HOMEPAGE="
	https://pypi.org/project/RAGatouille/
	https://github.com/AnswerDotAI/RAGatouille
"
SRC_URI="https://github.com/AnswerDotAI/RAGatouille/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.13[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/colbert-ai-0.2.19[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/llama-index[${PYTHON_USEDEP}]
		sci-ml/faiss[${PYTHON_USEDEP}]
		sci-ml/langchain-core[${PYTHON_USEDEP}]
		sci-ml/langchain[${PYTHON_USEDEP}]
		sci-ml/onnx[${PYTHON_USEDEP}]
		dev-python/srsly[${PYTHON_USEDEP}]
		dev-python/voyager[${PYTHON_USEDEP}]
		sci-ml/fast-pytorch-kmeans[${PYTHON_USEDEP}]
		sci-ml/sentence-transformers[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
