# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Local-first knowledge management combining Zettelkasten with knowledge graphs"
HOMEPAGE="https://github.com/basicmachines-co/basic-memory"
SRC_URI="https://github.com/basicmachines-co/basic-memory/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/aiosqlite-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/alembic-1.14.1[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.10.0[${PYTHON_USEDEP}]
	>=dev-python/asyncpg-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.136.1[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/fastembed-0.7.4[${PYTHON_USEDEP}]
	>=dev-python/greenlet-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/logfire-4.19.0[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
	>=dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/mdformat-0.7.22[${PYTHON_USEDEP}]
	>=dev-python/mdformat-frontmatter-2.0.8[${PYTHON_USEDEP}]
	>=dev-python/mdformat-gfm-0.3.7[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.23.1[${PYTHON_USEDEP}]
	>=dev-python/nest-asyncio-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.100.2[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9.0[${PYTHON_USEDEP}]
	>=dev-python/psycopg-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/pybars3-0.9.7[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.10.1[${PYTHON_USEDEP}]
	>=dev-python/pyright-1.1.390[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-frontmatter-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=dev-python/sniffio-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/sqlite-vec-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/unidecode-1.3.8[${PYTHON_USEDEP}]
	>=dev-python/uvloop-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/litellm-1.60.0[${PYTHON_USEDEP}]
	<dev-python/litellm-2.0.0[${PYTHON_USEDEP}]
"

src_prepare() {
	sed -i \
		-e 's|source = "uv-dynamic-versioning"|source = "code"\npath = "src/basic_memory/__init__.py"|' \
		-e 's|, "uv-dynamic-versioning>=0.7.0"||' \
		-e 's|"uv-dynamic-versioning>=0.7.0", ||' \
		pyproject.toml || die
	distutils-r1_src_prepare
}
