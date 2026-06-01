# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Monkey patch the standard zipfile module to enable Zstandard support"
HOMEPAGE="
	https://pypi.org/project/zipfile-zstd/
	https://github.com/taisei-project/python-zipfile-zstd
"
SRC_URI="https://github.com/taisei-project/python-zipfile-zstd/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/python-${P}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/zstandard-0.15.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
