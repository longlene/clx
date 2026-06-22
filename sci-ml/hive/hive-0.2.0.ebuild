# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Collaborative agent evolution platform with metadata-only hive mind"
HOMEPAGE="https://github.com/rllm-org/hive"
SRC_URI="https://github.com/rllm-org/hive/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="server"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/typer-0.15.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0[${PYTHON_USEDEP}]
		server? (
			>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
			>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
			dev-python/coolname[${PYTHON_USEDEP}]
			>=dev-python/psycopg-3.1.0[${PYTHON_USEDEP}]
			dev-python/psycopg-pool[${PYTHON_USEDEP}]
			>=dev-python/pyjwt-2.0[${PYTHON_USEDEP}]
			>=dev-python/cryptography-40.0[${PYTHON_USEDEP}]
			>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
		)
	')
"
