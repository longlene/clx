# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A lightweight and simple database using json"
HOMEPAGE="
	https://pypi.org/project/pickledb/
	https://github.com/patx/pickledb
"
SRC_URI="https://github.com/patx/pickledb/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/orjson[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
