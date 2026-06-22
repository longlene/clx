# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="RAG engine that pushes expensive computation to indexing time"
HOMEPAGE="https://github.com/quantumaikr/quantumrag"
SRC_URI="https://github.com/quantumaikr/quantumrag/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="anthropic api gemini lancedb openai"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
		>=dev-python/pdfplumber-0.11.9[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0[${PYTHON_USEDEP}]
		>=dev-python/structlog-24.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.12[${PYTHON_USEDEP}]
		anthropic? ( >=dev-python/anthropic-0.34[${PYTHON_USEDEP}] )
		api? (
			>=dev-python/fastapi-0.115[${PYTHON_USEDEP}]
			>=dev-python/python-multipart-0.0.7[${PYTHON_USEDEP}]
			>=dev-python/uvicorn-0.30[${PYTHON_USEDEP}]
		)
		gemini? ( >=dev-python/google-genai-1.0[${PYTHON_USEDEP}] )
		lancedb? ( >=dev-python/lancedb-0.12[${PYTHON_USEDEP}] )
		openai? ( >=dev-python/openai-1.40[${PYTHON_USEDEP}] )
	')
"
