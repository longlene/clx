# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

MY_PV="0.12.22"

DESCRIPTION="llama-index cli"
HOMEPAGE="https://github.com/run-llama/llama_index"
SRC_URI="https://github.com/run-llama/llama_index/archive/refs/tags/v${MY_PV}.tar.gz -> llama-index-${MY_PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/llama-index-core-0.12.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-embeddings-openai-0.3.0[${PYTHON_USEDEP}]
	>=sci-libs/llama-index-llms-openai-0.3.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/llama_index-${MY_PV}/${PN}
