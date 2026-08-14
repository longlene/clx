# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A CLI for Bilibili — browse videos, users, search, and feeds from the terminal"
HOMEPAGE="https://github.com/public-clis/bilibili-cli"
SRC_URI="https://github.com/public-clis/bilibili-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="audio"
RESTRICT="test"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/bilibili-api-python[${PYTHON_USEDEP}]
	dev-python/browser-cookie3[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	audio? ( dev-python/av[${PYTHON_USEDEP}] )
"
