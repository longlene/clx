# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Calculate prices for calling LLM inference APIs"
HOMEPAGE="
	https://pypi.org/project/genai-prices/
	https://github.com/pydantic/genai-prices
"
SRC_URI="https://github.com/pydantic/genai-prices/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${P}/packaages/python
