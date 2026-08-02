# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lightweight open-source AI agent for tools, chats, and workflows"
HOMEPAGE="https://github.com/HKUDS/nanobot"
SRC_URI="https://github.com/HKUDS/nanobot/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/nanobot-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="api azure discord langsmith matrix msteams olostep pdf wecom weixin"
RESTRICT="test"

RDEPEND="
	>=dev-python/anthropic-0.45.0[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.43.0[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/ddgs-9.5.5[${PYTHON_USEDEP}]
	>=dev-python/dingtalk-stream-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.25.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/json-repair-0.57.0[${PYTHON_USEDEP}]
	>=dev-python/lark-oapi-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
	>=dev-python/lxml-html-clean-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/oauth-cli-kit-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/openai-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.50[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/pypdf-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-docx-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-pptx-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-socks-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-5.16.0[${PYTHON_USEDEP}]
	>=dev-python/python-telegram-bot-22.6[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/qq-botpy-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/questionary-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/readability-lxml-0.8.4[${PYTHON_USEDEP}]
	>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
	>=dev-python/slack-sdk-3.39.0[${PYTHON_USEDEP}]
	>=dev-python/slackify-markdown-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/socksio-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-16.0[${PYTHON_USEDEP}]
	api? ( >=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/azure-identity-1.19.0[${PYTHON_USEDEP}] )
	discord? ( >=dev-python/discord-py-2.5.2[${PYTHON_USEDEP}] )
	langsmith? ( >=dev-python/langsmith-0.1.0[${PYTHON_USEDEP}] )
	matrix? (
		>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
		>=dev-python/matrix-nio-0.25.2[${PYTHON_USEDEP}]
		>=dev-python/mistune-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/nh3-0.2.17[${PYTHON_USEDEP}]
	)
	msteams? (
		>=dev-python/cryptography-41.0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.0[${PYTHON_USEDEP}]
	)
	olostep? ( >=dev-python/olostep-0.1.0[${PYTHON_USEDEP}] )
	pdf? ( >=dev-python/pymupdf-1.25.0[${PYTHON_USEDEP}] )
	wecom? ( >=dev-python/wecom-aibot-sdk-python-0.1.5[${PYTHON_USEDEP}] )
	weixin? (
		>=dev-python/pycryptodome-3.20.0[${PYTHON_USEDEP}]
		>=dev-python/qrcode-8.0[${PYTHON_USEDEP}]
	)
"

python_compile() {
	NANOBOT_SKIP_WEBUI_BUILD=1 distutils-r1_python_compile
}
