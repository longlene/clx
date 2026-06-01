# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A Pythonic framework to simplify AI service building"
HOMEPAGE="
	https://pypi.org/project/leptonai/
	https://github.com/leptonai/leptonai
	https://lepton.ai/
"
SRC_URI="https://github.com/leptonai/leptonai/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/anyio-3.7.0[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		>=dev-python/cloudpickle-3.0.0[${PYTHON_USEDEP}]
		dev-python/contextlib2[${PYTHON_USEDEP}]
		dev-python/exceptiongroup[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		>=dev-python/prometheus-fastapi-instrumentator-7.0.0[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.22.0[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/python-multipart[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/ledoc-ui[${PYTHON_USEDEP}]
		dev-python/ray[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
