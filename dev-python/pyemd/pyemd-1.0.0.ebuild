# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Fast EMD for Python"
HOMEPAGE="
	https://github.com/wmayner/pyemd
	https://pypi.org/project/pyemd/
"
SRC_URI="https://github.com/wmayner/pyemd/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.9.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYEMD="${PV}"
