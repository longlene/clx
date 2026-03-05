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
	>=sci-misc/litellm-1.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
		>=dev-python/websocket-client-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
		>=dev-python/oauth-cli-kit-0.1.1[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/readability-lxml-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
		>=dev-python/croniter-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/dingtalk-stream-0.4.0[${PYTHON_USEDEP}]
		>=dev-python/python-telegram-bot-21.0[${PYTHON_USEDEP}]
		>=dev-python/lark-oapi-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/socksio-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.11.0[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.0.8[${PYTHON_USEDEP}]
		>=dev-python/slack_sdk-3.26.0[${PYTHON_USEDEP}]
		>=dev-python/slackify-markdown-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/qq-botpy-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-socks-2.4.0[${PYTHON_USEDEP}]
		>=dev-python/prompt-toolkit-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.30.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
