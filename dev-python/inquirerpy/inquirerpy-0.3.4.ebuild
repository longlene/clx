# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/inquirerpy/
"
SRC_URI="https://github.com/kazhala/InquirerPy/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/prompt-toolkit-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/pfzy-0.3.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/InquirerPy-${PV}
