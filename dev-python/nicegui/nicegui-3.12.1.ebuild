# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Create web-based user interfaces with Python"
HOMEPAGE="https://nicegui.io https://github.com/zauberzeug/nicegui"
SRC_URI="https://github.com/zauberzeug/nicegui/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="matplotlib plotly redis"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/aiofiles[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.13.4[${PYTHON_USEDEP}]
		>=dev-python/certifi-2024.07.04[${PYTHON_USEDEP}]
		>=dev-python/docutils-0.19.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.109.1[${PYTHON_USEDEP}]
		>=dev-python/h11-0.16.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/idna-3.15[${PYTHON_USEDEP}]
		>=dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.1.2[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
		>=dev-python/lxml-6.1.0[${PYTHON_USEDEP}]
		>=dev-python/lxml-html-clean-0.4.4[${PYTHON_USEDEP}]
		>=dev-python/markdown2-2.4.7[${PYTHON_USEDEP}]
		>=dev-python/orjson-3.11.5[${PYTHON_USEDEP}]
		>=dev-python/pydantic-core-2.35.0[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.20.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/python-engineio-4.12.0[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.27[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.14.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-0.49.1[${PYTHON_USEDEP}]
		>=dev-python/tinycss2-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.22.0[${PYTHON_USEDEP}]
		>=dev-python/watchfiles-0.18.1[${PYTHON_USEDEP}]
		matplotlib? (
			>=dev-python/matplotlib-3.5.0[${PYTHON_USEDEP}]
			>=dev-python/pillow-12.2.0[${PYTHON_USEDEP}]
		)
		plotly? ( >=dev-python/plotly-5.13[${PYTHON_USEDEP}] )
		redis? ( >=dev-python/redis-4.0.0[${PYTHON_USEDEP}] )
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/poetry-core-1.0.0[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

python_prepare_all() {
	# Switch to standard poetry-core backend and embed the version
	# so poetry-dynamic-versioning (which needs git) is not required.
	sed -i \
		-e 's|"poetry_dynamic_versioning.backend"|"poetry.core.masonry.api"|' \
		-e 's|"poetry-core>=1.0.0,<2.0.0", "poetry-dynamic-versioning.*||' \
		-e 's|"poetry-core>=1.0.0,<2.0.0",.*||' \
		-e 's|requires = \["poetry-core>=1.0.0,<2.0.0",.*|requires = ["poetry-core>=1.0.0"]|' \
		pyproject.toml || die
	# Set the version in [tool.poetry] and remove dynamic versioning
	sed -i \
		-e "s|^version = \"0.0.0\"|version = \"${PV}\"|" \
		pyproject.toml || die
	distutils-r1_python_prepare_all
}
