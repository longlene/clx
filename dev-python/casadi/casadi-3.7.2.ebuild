# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Framework for algorithmic differentiation and numeric optimization"
HOMEPAGE="https://casadi.org"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

IUSE="doc"

BDEPEND="
	dev-build/cmake
	dev-lang/swig
	doc? ( app-text/doxygen )
"

RDEPEND="
	>=dev-python/numpy-1.0[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"
