# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Plugin for Poetry to enable dynamic versioning based on VCS tags"
HOMEPAGE="
	https://pypi.org/project/poetry-dynamic-versioning/
	https://github.com/mtkennerly/poetry-dynamic-versioning
"
SRC_URI="https://github.com/mtkennerly/poetry-dynamic-versioning/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dunamai-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.4[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.11.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
