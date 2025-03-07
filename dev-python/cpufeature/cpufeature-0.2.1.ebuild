# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Python CPU Feature Detection"
HOMEPAGE="
	https://pypi.org/project/cpufeature/
	https://github.com/robbmcleod/cpufeature
"
SRC_URI="https://github.com/robbmcleod/cpufeature/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
