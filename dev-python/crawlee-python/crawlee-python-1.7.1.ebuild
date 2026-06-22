# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Web scraping and browser automation library for reliable crawlers"
HOMEPAGE="https://crawlee.dev/python/ https://github.com/apify/crawlee-python"
SRC_URI="https://github.com/apify/crawlee-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="beautifulsoup curl-impersonate parsel postgres redis sqlite"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/async-timeout-5.0.1[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.5.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/impit-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-10.2.0[${PYTHON_USEDEP}]
	>=dev-python/protego-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/pyee-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/tldextract-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.18.0[${PYTHON_USEDEP}]
	beautifulsoup? (
		>=dev-python/beautifulsoup4-4.12.0[${PYTHON_USEDEP}]
		>=dev-python/html5lib-1.0[${PYTHON_USEDEP}]
	)
	curl-impersonate? ( >=dev-python/curl-cffi-0.9.0[${PYTHON_USEDEP}] )
	parsel? ( >=dev-python/parsel-1.10.0[${PYTHON_USEDEP}] )
	postgres? (
		>=dev-python/asyncpg-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}]
	)
	redis? ( >=dev-python/redis-7.0.0[${PYTHON_USEDEP}] )
	sqlite? (
		>=dev-python/aiosqlite-0.21.0[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}]
	)
')"

python_install() {
	distutils-r1_python_install
	# project_template/ contains Jinja2 template files that are not valid
	# Python; remove any spurious .pyc files generated for them
	find "${ED}" -path "*/crawlee/project_template*" -name "__pycache__" \
		-type d -exec rm -rf {} + 2>/dev/null || true
}
