# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Lazy parsing for Pydantic models"
HOMEPAGE="
	https://pypi.org/project/lazy-model/
	https://github.com/BeanieODM/lazy_model
"
SRC_URI="https://github.com/BeanieODM/lazy_model/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/lazy_model-${PV}
