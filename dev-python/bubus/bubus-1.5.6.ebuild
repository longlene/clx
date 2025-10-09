# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Advanced Pydantic-powered event bus with async support"
HOMEPAGE="
	https://pypi.org/project/bubus/
	https://github.com/browser-use/bubus
"
SRC_URI="https://github.com/browser-use/bubus/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.9.0[${PYTHON_USEDEP}]
	>=dev-python/portalocker-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.5[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/uuid7-0.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
