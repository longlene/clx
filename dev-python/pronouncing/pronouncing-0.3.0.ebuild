# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A simple interface for the CMU pronouncing dictionary"
HOMEPAGE="https://github.com/aparrish/pronouncingpy/ https://pypi.org/project/pronouncing/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cmudict[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
