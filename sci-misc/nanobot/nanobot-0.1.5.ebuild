# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A lightweight personal AI assistant framework"
HOMEPAGE="
	https://pypi.org/project/nanobot/
	https://github.com/HKUDS/nanobot
"
SRC_URI="https://github.com/HKUDS/nanobot/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/typer-0.20.0[${PYTHON_USEDEP}]
		>=dev-python/anthropic-0.45.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.12.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-16.0[${PYTHON_USEDEP}]
		>=dev-python/websocket-client-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
		>=dev-python/ddgs-9.5.5[${PYTHON_USEDEP}]
		>=dev-python/oauth-cli-kit-0.1.3[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		>=dev-python/readability-lxml-0.8.4[${PYTHON_USEDEP}]
		>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
		>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/dingtalk-stream-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/python-telegram-bot-22.6[${PYTHON_USEDEP}]
		>=dev-python/lark-oapi-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/socksio-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.16.0[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/slack-sdk-3.39.0[${PYTHON_USEDEP}]
		>=dev-python/slackify-markdown-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/qq-botpy-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-socks-2.8.0[${PYTHON_USEDEP}]
		>=dev-python/prompt-toolkit-3.0.50[${PYTHON_USEDEP}]
		>=dev-python/questionary-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.26.0[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.57.0[${PYTHON_USEDEP}]
		>=dev-python/chardet-3.0.2[${PYTHON_USEDEP}]
		>=dev-python/openai-2.8.0[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/jinja22-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/dulwich-0.22.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
