# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Open-source AI sandbox infrastructure for code execution, browser use, and AI agents"
HOMEPAGE="
	https://pypi.org/project/smolvm/
	https://github.com/CelestoAI/SmolVM
	https://docs.celesto.ai/smolvm
"
SRC_URI="
	https://github.com/CelestoAI/SmolVM/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/smolvm-core-${PV}[${PYTHON_USEDEP}]
	>=dev-python/paramiko-3.0[${PYTHON_USEDEP}]
	>=dev-python/pycdlib-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28[${PYTHON_USEDEP}]
	>=dev-python/requests-unixsocket-0.3[${PYTHON_USEDEP}]
	>=dev-python/zstandard-0.22[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/SmolVM-${PV}
