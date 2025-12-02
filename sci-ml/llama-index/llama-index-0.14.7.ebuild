# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="LlamaIndex is a data framework for your LLM applications"
HOMEPAGE="https://github.com/run-llama/llama_index"
SRC_URI="https://github.com/run-llama/llama_index/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/llama-index-cli-0.5.0[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-core-0.14.7[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-embeddings-openai-0.5.0[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-indices-managed-llama-cloud-0.4.0[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-llms-openai-0.6.0[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-readers-file-0.5.0[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-readers-llama-parse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.8.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/llama_index-${PV}
