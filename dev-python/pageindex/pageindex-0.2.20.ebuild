# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Vectorless, reasoning-based document index for RAG"
HOMEPAGE="
	https://github.com/VectifyAI/PageIndex
	https://pageindex.ai
"
SRC_URI="https://github.com/VectifyAI/PageIndex/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/PageIndex-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="anthropic claude"

RDEPEND="
	anthropic? ( >=dev-python/anthropic-0.122.0[${PYTHON_USEDEP}] )
	claude? ( >=dev-python/claude-agent-sdk-0.1.53[${PYTHON_USEDEP}] )
	>=dev-python/litellm-1.97.0[${PYTHON_USEDEP}]
	>=dev-python/pypdf-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.70.0[${PYTHON_USEDEP}]
	>=dev-python/openai-agents-0.18.1[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.0[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-5[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/regex-2024.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest

src_prepare() {
	eapply_user
	# The v0.2.20 tag still carries version 0.2.10 in pyproject.toml.
	sed -i -E "s/^version = .*/version = \"${PV}\"/" pyproject.toml || die
	# Upstream declares the legacy PyPDF2 package; it was renamed to pypdf
	# and Gentoo only provides dev-python/pypdf, so follow the rename.
	find pageindex tests -name '*.py' -exec sed -i 's/PyPDF2/pypdf/g' {} + || die
	distutils-r1_src_prepare
}
