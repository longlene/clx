# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Cua (Computer Use) agent for AI-driven computer interaction"
HOMEPAGE="
	https://github.com/trycua/cua
	https://pypi.org/project/cua-agent/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cli computer gemini hf omni ui"

# upstream pins litellm exactly; relaxed to a lower bound
RDEPEND="
	>=dev-python/litellm-1.86.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.4.1[${PYTHON_USEDEP}]
		>=dev-python/certifi-2024.2.2[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.6.4[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/rich-13.7.1[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
		>=sci-ml/cua-core-0.3.0[${PYTHON_USEDEP}]
		<sci-ml/cua-core-0.4.0[${PYTHON_USEDEP}]
		cli? ( >=dev-python/yaspin-3.1.0[${PYTHON_USEDEP}] )
		computer? (
			>=sci-ml/cua-computer-0.5.0[${PYTHON_USEDEP}]
			<sci-ml/cua-computer-0.6.0[${PYTHON_USEDEP}]
		)
		gemini? ( >=dev-python/google-genai-1.41.0[${PYTHON_USEDEP}] )
	')
	hf? (
		sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
		sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
		>=sci-ml/transformers-4.55.0[${PYTHON_SINGLE_USEDEP}]
	)
	omni? (
		>=sci-ml/cua-som-0.1.0[${PYTHON_SINGLE_USEDEP}]
		<sci-ml/cua-som-0.2.0[${PYTHON_SINGLE_USEDEP}]
	)
	ui? ( >=dev-python/gradio-6.0.0[${PYTHON_SINGLE_USEDEP}] )
"

EPYTEST_PLUGINS=( pytest-asyncio )

distutils_enable_tests pytest
