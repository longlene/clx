# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Generate and download e-books from online sources"
HOMEPAGE="https://github.com/lncrawl/lightnovel-crawler"
SRC_URI="https://github.com/lncrawl/lightnovel-crawler/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/alembic-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/base58-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.0.0[${PYTHON_USEDEP}]
	<dev-python/beautifulsoup4-5.0.0[${PYTHON_USEDEP}]
	>=app-arch/brotli-1.2.0[python,${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.0[${PYTHON_USEDEP}]
	<dev-python/colorama-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/ebooklib-0.18.0[${PYTHON_USEDEP}]
	<dev-python/ebooklib-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	dev-python/h2[${PYTHON_USEDEP}]
	>=dev-python/humanize-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/imap-tools-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/lncrawl-scraper-0.2.5[${PYTHON_USEDEP}]
	>=dev-python/lncrawl-translator-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.4.0[${PYTHON_USEDEP}]
	<dev-python/lxml-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/nodriver-0.50[${PYTHON_USEDEP}]
	>=dev-python/libpass-1.7.0[${PYTHON_USEDEP}]
	dev-python/argon2-cffi[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/psycopg-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.0.0[${PYTHON_USEDEP}]
	<dev-python/pycryptodome-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyease-grpc-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.0.0[${PYTHON_USEDEP}]
	<dev-python/pyparsing-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-box-7.0.0[${PYTHON_USEDEP}]
	<dev-python/python-box-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	<dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	<dev-python/python-dotenv-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-jose-3.4.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-8.0.0[${PYTHON_USEDEP}]
	<dev-python/python-slugify-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/questionary-2.0.0[${PYTHON_USEDEP}]
	<dev-python/questionary-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/exejs-0.0.7[${PYTHON_USEDEP}]
	>=dev-python/readability-lxml-0.8.0[${PYTHON_USEDEP}]
	<dev-python/readability-lxml-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/regex-2024.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
	dev-python/pysocks[${PYTHON_USEDEP}]
	>=dev-python/sqlmodel-0.0.22[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
	<dev-python/tqdm-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.32.0[${PYTHON_USEDEP}]
	>=dev-python/zstd-1.5.7.0[${PYTHON_USEDEP}]
"
