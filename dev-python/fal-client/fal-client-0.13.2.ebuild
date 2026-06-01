# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python client for fal.ai"
HOMEPAGE="
	https://pypi.org/project/fal-client/
	https://github.com/fal-ai/fal/
"
SRC_URI="https://github.com/fal-ai/fal/archive/refs/tags/fal_client_v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/fal-fal_client_v${PV}/projects/fal_client
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
