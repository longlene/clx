# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A drop-in replacement for pdb and pdbpp"
HOMEPAGE="
	https://pypi.org/project/pdbp/
	https://github.com/mdmintz/pdbp
"
SRC_URI="https://github.com/mdmintz/pdbp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pygments-2.19.1[${PYTHON_USEDEP}]
	>=dev-python/tabcompleter-1.4.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
