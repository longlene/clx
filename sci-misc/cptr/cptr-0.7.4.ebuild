# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Computer-use agent: control your machine from the web"
HOMEPAGE="https://github.com/open-webui/computer"
SRC_URI="https://github.com/open-webui/computer/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/computer-${PV}"

LICENSE="Open-Use-License"
SLOT="0"
KEYWORDS="~amd64"
IUSE="agents mcp"
RESTRICT="test"

src_prepare() {
	# Frontend build directory is not included in GitHub archive
	sed -i '/"cptr\/frontend\/build"/d' pyproject.toml || die
	distutils-r1_src_prepare
}

RDEPEND="
	>=dev-python/alembic-1.13[${PYTHON_USEDEP}]
	>=dev-python/aiosqlite-0.20[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-4.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.128.8[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-5.11[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	>=dev-python/truststore-0.10[${PYTHON_USEDEP}]
	>=dev-python/watchdog-6.0.0[${PYTHON_USEDEP}]
	agents? ( >=dev-python/claude-agent-sdk-0.1.62[${PYTHON_USEDEP}] )
	mcp? ( >=dev-python/mcp-1.8[${PYTHON_USEDEP}] )
"
