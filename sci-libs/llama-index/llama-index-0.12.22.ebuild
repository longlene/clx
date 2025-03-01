# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="LlamaIndex is a data framework for your LLM applications"
HOMEPAGE="https://github.com/run-llama/llama_index"
SRC_URI="https://github.com/run-llama/llama_index/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/llama-index-llms-openai-0.3.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-embeddings-openai-0.3.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-program-openai-0.3.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-question-gen-openai-0.3.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-agent-openai-0.4.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-readers-file-0.4.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-readers-llama-parse-0.4.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-indices-managed-llama-cloud-0.4.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-core-${PV}[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-multi-modal-llms-openai-0.4.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-cli-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.8.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/llama_index-${PV}
