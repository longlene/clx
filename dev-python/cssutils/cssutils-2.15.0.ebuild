# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A CSS Cascading Style Sheets library for Python"
HOMEPAGE="https://github.com/jaraco/cssutils https://pypi.org/project/cssutils/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="$(python_gen_cond_dep '
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/encutils[${PYTHON_USEDEP}]
')"

BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/cssselect[${PYTHON_USEDEP}]
			dev-python/jaraco-test[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest
