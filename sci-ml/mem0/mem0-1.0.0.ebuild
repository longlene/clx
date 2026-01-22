# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Long-term memory for AI Agents"
HOMEPAGE="
	https://pypi.org/project/mem0/
	https://github.com/mem0ai/mem0/
"
SRC_URI="https://github.com/mem0ai/mem0/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/qdrant-client-1.9.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.3[${PYTHON_USEDEP}]
	>=dev-python/openai-1.90.0[${PYTHON_USEDEP}]
	>=dev-python/posthog-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2024.1[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.29.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
