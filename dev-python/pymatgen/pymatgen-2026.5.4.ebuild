# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python Materials Genomics - a robust materials analysis code"
HOMEPAGE="https://pymatgen.org https://github.com/materialsproject/pymatgen"
SRC_URI="https://github.com/materialsproject/pymatgen/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}/pymatgen-${PV}"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pymatgen-core[${PYTHON_USEDEP}]
"

# BDEPEND for build-time dependencies: Cython, numpy, setuptools are handled by distutils-r1
# But we may need explicit Cython and numpy if they are not automatically added.
# We'll leave BDEPEND empty as distutils-r1 handles setuptools.

distutils_enable_tests pytest
