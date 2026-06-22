# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for the Tavily API"
HOMEPAGE="https://github.com/tavily-ai/tavily-python https://pypi.org/project/tavily-python/"
S="${WORKDIR}/tavily_python-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.5.1[${PYTHON_USEDEP}]
"
