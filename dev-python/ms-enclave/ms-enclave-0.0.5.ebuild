# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Modularized and stable sandbox runtime environment for LLM agents"
HOMEPAGE="https://github.com/modelscope/ms-enclave"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.104.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.24.0[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.7[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
		>=dev-python/shortuuid-1.0.13[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
		dev-python/docstring-parser[${PYTHON_USEDEP}]
	')
"
