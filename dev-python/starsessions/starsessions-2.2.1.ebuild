# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Advanced sessions for Starlette and FastAPI frameworks"
HOMEPAGE="
	https://pypi.org/project/starsessions/
	https://github.com/alex-oleshkevich/starsessions
"
SRC_URI="https://github.com/alex-oleshkevich/starsessions/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/starlette[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
