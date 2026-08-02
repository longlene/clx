# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13,14} )

inherit distutils-r1

MY_PV="${PV/_p/.post}"

DESCRIPTION="Personal AI assistant with multi-channel chat and extensible skills"
HOMEPAGE="
	http://qwenpaw.agentscope.io/
	https://github.com/agentscope-ai/QwenPaw
"
SRC_URI="https://github.com/agentscope-ai/QwenPaw/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/QwenPaw-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="sip livekit whisper adbpg"

REQUIRED_USE="livekit? ( sip )"

RDEPEND="
	>=sci-ml/agentscope-1.0.20
	sci-ml/agentscope-runtime
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.20.0[${PYTHON_SINGLE_USEDEP}]
	whisper? ( sci-ml/openai-whisper[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		>=sci-ml/modelscope-1.35.0[${PYTHON_USEDEP}]
		>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.0.0[${PYTHON_USEDEP}]
		<dev-python/anyio-4.13.0[${PYTHON_USEDEP}]
		>=dev-python/apscheduler-3.11.2[${PYTHON_USEDEP}]
		<dev-python/apscheduler-4[${PYTHON_USEDEP}]
		>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.30.0[${PYTHON_USEDEP}]
		>=dev-python/keyring-25.0.0[${PYTHON_USEDEP}]
		>=dev-python/openai-2.0.0[${PYTHON_USEDEP}]
		<=dev-python/openai-2.33.0-r9999[${PYTHON_USEDEP}]
		<dev-python/onnxruntime-1.24[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
		dev-python/python-socks[${PYTHON_USEDEP}]
		>=dev-python/shortuuid-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/tzdata-2024.1[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.40.0[${PYTHON_USEDEP}]
		>=dev-python/watchfiles-0.22[${PYTHON_USEDEP}]
		>=dev-python/google-genai-1.67.0[${PYTHON_USEDEP}]
		>=dev-python/questionary-2.1.1[${PYTHON_USEDEP}]
		dev-python/mss[${PYTHON_USEDEP}]
		dev-python/segno[${PYTHON_USEDEP}]
		>=dev-python/paho-mqtt-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/playwright-1.49.0[${PYTHON_USEDEP}]
		dev-python/pywebview[${PYTHON_USEDEP}]
		>=dev-python/python-lsp-server-1.10[${PYTHON_USEDEP}]
		>=dev-python/discord-py-2.3[${PYTHON_USEDEP}]
		>=dev-python/dingtalk-stream-0.24.3[${PYTHON_USEDEP}]
		>=dev-python/alibabacloud-dingtalk-2.2.42[${PYTHON_USEDEP}]
		>=dev-python/alibabacloud-tea-openapi-0.4.4[${PYTHON_USEDEP}]
		>=dev-python/alibabacloud-credentials-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/alibabacloud-tea-util-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/lark-oapi-1.5.3[${PYTHON_USEDEP}]
		>=dev-python/python-telegram-bot-20.0[${PYTHON_USEDEP}]
		>=dev-python/twilio-9.10.2[${PYTHON_USEDEP}]
		dev-python/reme-ai[${PYTHON_USEDEP}]
		>=dev-python/matrix-nio-0.24.0[${PYTHON_USEDEP}]
		dev-python/wecom-aibot-python-sdk[${PYTHON_USEDEP}]
		>=dev-python/agent-client-protocol-0.9.0[${PYTHON_USEDEP}]
		sip? (
			dev-python/pyvoip[${PYTHON_USEDEP}]
			dev-python/dashscope[${PYTHON_USEDEP}]
			dev-python/dashscope-realtime[${PYTHON_USEDEP}]
		)
		livekit? (
			>=dev-python/livekit-1.0.0[${PYTHON_USEDEP}]
			>=dev-python/livekit-api-0.6.0[${PYTHON_USEDEP}]
		)
		adbpg? ( dev-python/psycopg:2[${PYTHON_USEDEP}] )
	')
	sip? ( $(python_gen_cond_dep 'dev-python/audioop-lts[${PYTHON_USEDEP}]' python3_13) )
	app-misc/ast-grep
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
