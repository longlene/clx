# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python toolkit for Retrieval-Augmented Generation (RAG)"
HOMEPAGE="
	https://pypi.org/project/raglite/
	https://github.com/superlinear-ai/raglite
"
SRC_URI="https://github.com/superlinear-ai/raglite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/platformdirs-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pdftext-0.3.13[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-1.4.2[${PYTHON_USEDEP}]
	>=dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/mdformat-gfm-0.3.6[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/wtpsplit-lite-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/huggingface-hub-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/litellm-1.48.4[${PYTHON_USEDEP}]
	>=dev-python/llama-cpp-python-0.3.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/pynndescent-0.5.12[${PYTHON_USEDEP}]
	>=dev-python/langdetect-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/rerankers-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/pg8000-1.31.2[${PYTHON_USEDEP}]
	>=dev-python/sqlmodel-slim-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.5[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
