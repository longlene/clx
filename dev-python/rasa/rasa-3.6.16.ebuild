# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..12} )
inherit distutils-r1

DESCRIPTION="Open source machine learning framework"
HOMEPAGE="https://rasa.com"
SRC_URI="https://github.com/RasaHQ/rasa/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/boto3-1.26.136[${PYTHON_USEDEP}]
	>=dev-python/requests-2.23[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.1[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3[${PYTHON_USEDEP}]
	>=dev-python/jsonpickle-1.3[${PYTHON_USEDEP}]
	>=dev-python/redis-4.5.3[${PYTHON_USEDEP}]
	>=dev-python/absl-py-0.9[${PYTHON_USEDEP}]
	>=dev-python/APScheduler-3.6[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.31[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.4[${PYTHON_USEDEP}]
	>=dev-python/fbmessenger-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pykwalify-1.7[${PYTHON_USEDEP}]
	>=dev-python/coloredlogs-10[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.16.5[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/twilio-6.26[${PYTHON_USEDEP}]
	>=dev-python/webexteamssdk-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/mattermostwrapper-2.2[${PYTHON_USEDEP}]
	>=dev-python/rocketchat_API-0.6.31[${PYTHON_USEDEP}]
	>=dev-python/colorhash-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.1[${PYTHON_USEDEP}]
	>=dev-python/rasa-sdk-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/colorclass-2.2[${PYTHON_USEDEP}]
	>=dev-python/terminaltables-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/sanic-21.12[${PYTHON_USEDEP}]
	>=dev-python/sanic-cors-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/sanic-jwt-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/sanic-routing-0.7.2[${PYTHON_USEDEP}]
	>=dev-python/websockets-10.0[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-1.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6[${PYTHON_USEDEP}]
	>=dev-python/questionary-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.4[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4[${PYTHON_USEDEP}]
	>=dev-python/pydot-1.4[${PYTHON_USEDEP}]
	>=dev-python/SQLAlchemy-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/sklearn-crfsuite-0.3[${PYTHON_USEDEP}]
	>=dev-python/psycopg2-binary-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.23.3[${PYTHON_USEDEP}]
	>=dev-python/tensorflow_hub-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-65.5.1[${PYTHON_USEDEP}]
	>=dev-python/ujson-1.35[${PYTHON_USEDEP}]
	>=dev-python/regex-2020.6[${PYTHON_USEDEP}]
	>=dev-python/joblib-0.15.1[${PYTHON_USEDEP}]
	>=dev-python/sentry-sdk-0.17.0[${PYTHON_USEDEP}]
	>=dev-python/aio-pika-6.7.1[${PYTHON_USEDEP}]
	dev-python/aiogram[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1.1[${PYTHON_USEDEP}]
	>=dev-python/typing-utils-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/tarsafe-0.0.3[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
	>=dev-python/CacheControl-0.12.9[${PYTHON_USEDEP}]
	>=dev-python/randomname-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/slack-sdk-3.19.2[${PYTHON_USEDEP}]
	>=dev-python/confluent-kafka-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/portalocker-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/structlog-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/structlog-sentry-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.38.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.7.22[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.2[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest
