# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Asynchronous Python ODM for MongoDB"
HOMEPAGE="
	https://pypi.org/project/beanie/
	http://beanie-odm.dev/
	https://github.com/BeanieODM/beanie
"
SRC_URI="https://github.com/BeanieODM/beanie/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-1.10.18[${PYTHON_USEDEP}]
	>=dev-python/click-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/lazy-model-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/pymongo-4.11.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
