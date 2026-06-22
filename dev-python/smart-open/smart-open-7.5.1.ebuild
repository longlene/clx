# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Utils for streaming large files"
HOMEPAGE="
	https://pypi.org/project/smart-open/
	https://github.com/piskvorky/smart_open
"
SRC_URI="https://github.com/piskvorky/smart_open/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/smart_open-${PV}
KEYWORDS="~amd64"

RDEPEND="
	dev-python/wrapt[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
