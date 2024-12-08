# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Hatchling plugin to read project dependencies from requirements.txt"
HOMEPAGE="
	https://github.com/repo-helper/hatch-requirements-txt
	https://pypi.org/project/hatch-requirements-txt/
"
SRC_URI="https://github.com/repo-helper/hatch-requirements-txt/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
