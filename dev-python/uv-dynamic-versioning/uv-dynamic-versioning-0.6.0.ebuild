# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Dynamic versioning based on VCS tags for uv/hatch project"
HOMEPAGE="
	https://pypi.org/project/uv-dynamic-versioning/
	https://github.com/ninoseki/uv-dynamic-versioning/
"
SRC_URI="https://github.com/ninoseki/uv-dynamic-versioning/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dunamai-1.23[${PYTHON_USEDEP}]
	>=dev-python/hatchling-1.26[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10[${PYTHON_USEDEP}]
	>=dev-python/returns-0.23[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.13[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
