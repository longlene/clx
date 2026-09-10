# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Session manager for A2A applications"
HOMEPAGE="https://pypi.org/project/chuk-session-manager/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/chuk-tool-processor-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
