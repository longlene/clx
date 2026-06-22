# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Finite-state grammar compilation library"
HOMEPAGE="https://pynini.opengrm.org https://pypi.org/project/pynini/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# upstream: 2.1.7 is compatible with OpenFst 1.8.4 only (see NEWS)
DEPEND="=sci-misc/openfst-1.8.4*"
RDEPEND="
	${DEPEND}
	$(python_gen_cond_dep '
		dev-python/absl-py[${PYTHON_USEDEP}]
	')
"
BDEPEND="$(python_gen_cond_dep '
	>=dev-python/cython-3.0.6[${PYTHON_USEDEP}]
')"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
