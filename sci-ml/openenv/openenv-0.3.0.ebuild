# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Interface library for RL post-training with environments"
HOMEPAGE="https://github.com/huggingface/OpenEnv"
SRC_URI="https://github.com/huggingface/OpenEnv/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/OpenEnv-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/huggingface_hub-0.20.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/gradio-4.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.104.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.25.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/openai-2.7.2[${PYTHON_USEDEP}]
		>=dev-python/tomli-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/tomli-w-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
		>=dev-python/fastmcp-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	')
"
