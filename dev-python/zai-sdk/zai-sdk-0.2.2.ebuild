# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A SDK library for accessing big model apis from Z.ai"
HOMEPAGE="
	https://pypi.org/project/zai-sdk/
	https://github.com/zai-org/z-ai-sdk-python
"
SRC_URI="https://github.com/zai-org/z-ai-sdk-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/z-ai-sdk-python-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.2.2[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/sniffio-1.3.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
