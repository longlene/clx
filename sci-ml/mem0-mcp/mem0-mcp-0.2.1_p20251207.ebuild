# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="b53a1f327032352f730a5df0461a2f597892a843"

DESCRIPTION="Model Context Protocol server that exposes the Mem0 long-term memory API as tools"
HOMEPAGE="
	https://pypi.org/project/mem0-mcp-server/
	https://github.com/mem0ai/mem0-mcp/
"
SRC_URI="https://github.com/mem0ai/mem0-mcp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/mcp-1.6.0[${PYTHON_USEDEP}]
	>=sci-ml/mem0-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
	>=sci-ml/pydantic-ai-slim-1.14.1[${PYTHON_USEDEP}]
	>=sci-ml/smithery-0.4.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/mem0-mcp-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
