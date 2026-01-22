# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Client library for the Qdrant vector search engine"
HOMEPAGE="
	https://pypi.org/project/qdrant-client/
	https://github.com/qdrant/qdrant-client
"
SRC_URI="https://github.com/qdrant/qdrant-client/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.8[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.41.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.14[${PYTHON_USEDEP}]
	>=dev-python/portalocker-2.7.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
