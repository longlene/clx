# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Simple and Fast Retrieval-Augmented Generation"
HOMEPAGE="https://github.com/HKUDS/LightRAG"
SRC_URI="https://github.com/HKUDS/LightRAG/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/LightRAG-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_any_dep '
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.0.0[${PYTHON_USEDEP}]
	dev-python/json-repair[${PYTHON_USEDEP}]
	dev-python/nano-vectordb[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0.0[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pypinyin[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/xlsxwriter-3.1.0[${PYTHON_USEDEP}]
')"
