# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Library for reading and writing large multi-dimensional arrays"
HOMEPAGE="https://github.com/google/tensorstore"
SRC_URI="https://github.com/google/tensorstore/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/ml-dtypes-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-build/bazel
"
