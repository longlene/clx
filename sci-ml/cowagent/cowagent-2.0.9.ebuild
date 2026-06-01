# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Open-source AI assistant and Agent Harness for WeChat and more"
HOMEPAGE="https://cowagent.ai https://github.com/zhayujie/CowAgent"
SRC_URI="https://github.com/zhayujie/CowAgent/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/CowAgent-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc feishu plugins tiktoken voice wechat"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiohttp-3.8.6[${PYTHON_USEDEP}]
	>=dev-python/chardet-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/croniter-2.0.0[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.2[${PYTHON_USEDEP}]
	doc? (
		dev-python/openpyxl[${PYTHON_USEDEP}]
		dev-python/pypdf[${PYTHON_USEDEP}]
		dev-python/python-docx[${PYTHON_USEDEP}]
		dev-python/python-pptx[${PYTHON_USEDEP}]
	)
	feishu? ( >=dev-python/lark-oapi-1.5.3[${PYTHON_USEDEP}] )
	plugins? ( dev-python/dulwich[${PYTHON_USEDEP}] )
	tiktoken? ( >=dev-python/tiktoken-0.3.2[${PYTHON_USEDEP}] )
	voice? (
		dev-python/edge-tts[${PYTHON_USEDEP}]
		>=dev-python/gtts-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
	)
	wechat? (
		dev-python/pycryptodome[${PYTHON_USEDEP}]
		>=dev-python/websocket-client-1.4.0[${PYTHON_USEDEP}]
		dev-python/wechatpy[${PYTHON_USEDEP}]
	)
"
