# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Natural-language finance research AI agent with backtesting"
HOMEPAGE="https://github.com/HKUDS/Vibe-Trading"
SRC_URI="https://github.com/HKUDS/Vibe-Trading/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Vibe-Trading-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ashare deepseek harmonic ibkr"
RESTRICT="test"

src_prepare() {
	printf '\n[build-system]\nrequires = ["setuptools"]\nbuild-backend = "setuptools.build_meta"\n' \
		>> pyproject.toml || die
	distutils-r1_src_prepare
}

RDEPEND="
	>=dev-python/akshare-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/ccxt-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/ddgs-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/duckdb-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.104.0[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-2.14.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/joblib-1.3.0[${PYTHON_USEDEP}]
	>=sci-ml/langchain-1.0.0[${PYTHON_USEDEP}]
	>=sci-ml/langchain-core-1.0.0[${PYTHON_USEDEP}]
	>=sci-ml/langchain-openai-1.0.0[${PYTHON_USEDEP}]
	>=sci-ml/langgraph-1.0.10[${PYTHON_USEDEP}]
	>=sci-ml/langgraph-checkpoint-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/oauth-cli-kit-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-docx-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/python-pptx-0.6.23[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/smartmoneyconcepts-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/sse-starlette-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/tushare-1.2.89[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/weasyprint-60.0[${PYTHON_USEDEP}]
	>=dev-python/yfinance-0.2.30[${PYTHON_USEDEP}]
	ashare? ( >=dev-python/baostock-0.8.8[${PYTHON_USEDEP}] )
	deepseek? ( >=dev-python/langchain-deepseek-1.0.0[${PYTHON_USEDEP}] )
	harmonic? ( >=dev-python/pyharmonics-1.5.0[${PYTHON_USEDEP}] )
	ibkr? ( >=dev-python/ib-async-2.0[${PYTHON_USEDEP}] )
"
