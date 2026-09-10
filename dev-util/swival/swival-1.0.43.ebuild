# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Small, powerful, open-source CLI coding agent that works with open models"
HOMEPAGE="https://swival.dev/ https://github.com/Swival/swival"
SRC_URI="https://github.com/Swival/swival/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="metaskills"

RDEPEND="
	dev-python/litellm
	$(python_gen_cond_dep '
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/html-to-markdown[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/prompt-toolkit[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/rank-bm25[${PYTHON_USEDEP}]
		dev-python/httpx2[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/fast-cipher[${PYTHON_USEDEP}]
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/google-cloud-aiplatform[${PYTHON_USEDEP}]
		metaskills? ( dev-python/starlark-go[${PYTHON_USEDEP}] )
	')
"

distutils_enable_tests pytest
