# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

EGIT_COMMIT="d04293ff30b7d0be7971028f3b3c43780de93f21"

DESCRIPTION="Telegram Bot API for Python"
HOMEPAGE="https://github.com/unixtux/tglib"
SRC_URI="https://github.com/unixtux/tglib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.11.17[${PYTHON_USEDEP}]
	>=dev-python/ujson-5.9.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
