# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Resolving Swagger/OpenAPI 2.0 and 3.0 Parser"
HOMEPAGE="
	https://pypi.org/project/prance/
	https://github.com/RonnyPfannschmidt/prance/
"
SRC_URI="https://github.com/RonnyPfannschmidt/prance/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/chardet-5.2[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.18.10[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
