# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Patch asyncio to allow nested event loops"
HOMEPAGE="
	https://pypi.org/project/nest-asyncio2/
	https://github.com/Chaoses-Ib/nest-asyncio2
"
SRC_URI="https://github.com/Chaoses-Ib/nest-asyncio2/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
