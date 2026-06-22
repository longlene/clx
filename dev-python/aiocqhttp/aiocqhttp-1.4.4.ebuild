# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A Python SDK with async I/O for CQHTTP"
HOMEPAGE="
	https://pypi.org/project/aiocqhttp/
	https://github.com/nonebot/aiocqhttp
	https://aiocqhttp.nonebot.dev/
"
SRC_URI="https://github.com/nonebot/aiocqhttp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/quart-0.17[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.11[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
