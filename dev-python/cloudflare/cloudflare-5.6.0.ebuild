# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The official Python library for the Cloudflare API"
HOMEPAGE="https://github.com/cloudflare/cloudflare-python"
SRC_URI="https://github.com/cloudflare/cloudflare-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/cloudflare-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="aiohttp"
RESTRICT="test"

RDEPEND="
	dev-python/anyio[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	aiohttp? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/httpx-aiohttp[${PYTHON_USEDEP}]
	)
"
