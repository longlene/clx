# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="AI Agent Assistant and development framework for LLMs and IM platforms"
HOMEPAGE="https://astrbot.app https://github.com/AstrBotDevs/AstrBot"
SRC_URI="https://github.com/AstrBotDevs/AstrBot/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/AstrBot-${PV}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# Not yet packaged in portage:
#   dev-python/faiss-cpu         (vector similarity search)
#   dev-python/py-cord           (Discord bot library)
#   dev-python/python-ripgrep    (ripgrep bindings)
#   dev-python/shipyard-python-sdk
#   dev-python/shipyard-neo-sdk
# Web dashboard requires ASTRBOT_BUILD_DASHBOARD=1 and npm; not built in this ebuild.

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/aiocqhttp[${PYTHON_USEDEP}]
		dev-python/aiodocker[${PYTHON_USEDEP}]
		dev-python/aiofiles[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/aiosqlite[${PYTHON_USEDEP}]
		dev-python/anthropic[${PYTHON_USEDEP}]
		dev-python/apscheduler[${PYTHON_USEDEP}]
		dev-python/audioop-lts[${PYTHON_USEDEP}]
		>=dev-python/certifi-2025.4.26[${PYTHON_USEDEP}]
		>=dev-python/chardet-5.1.0[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/dashscope[${PYTHON_USEDEP}]
		dev-python/deprecated[${PYTHON_USEDEP}]
		dev-python/dingtalk-stream[${PYTHON_USEDEP}]
		dev-python/docstring-parser[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/google-genai[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/jieba[${PYTHON_USEDEP}]
		dev-python/lark-oapi[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/markitdown-no-magika[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/ormsgpack[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
		>=dev-python/pillow-11.2.1[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pydub[${PYTHON_USEDEP}]
		dev-python/pyjwt[${PYTHON_USEDEP}]
		dev-python/pypdf[${PYTHON_USEDEP}]
		dev-python/python-socks[${PYTHON_USEDEP}]
		dev-python/python-telegram-bot[${PYTHON_USEDEP}]
		dev-python/pysocks[${PYTHON_USEDEP}]
		dev-python/qq-botpy[${PYTHON_USEDEP}]
		dev-python/qrcode[${PYTHON_USEDEP}]
		dev-python/quart[${PYTHON_USEDEP}]
		dev-python/rank-bm25[${PYTHON_USEDEP}]
		dev-python/silk-python[${PYTHON_USEDEP}]
		dev-python/slack-sdk[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.41[${PYTHON_USEDEP}]
		dev-python/sqlmodel[${PYTHON_USEDEP}]
		dev-python/telegramify-markdown[${PYTHON_USEDEP}]
		dev-python/tenacity[${PYTHON_USEDEP}]
		dev-python/watchfiles[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
		dev-python/wechatpy[${PYTHON_USEDEP}]
		dev-python/xinference-client[${PYTHON_USEDEP}]
	')
"
