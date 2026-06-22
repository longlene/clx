# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Encoding detection helper functions for HTML, XML, CSS via HTTP"
HOMEPAGE="https://github.com/coherent-oss/encutils https://pypi.org/project/encutils/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="$(python_gen_cond_dep '
	dev-python/chardet[${PYTHON_USEDEP}]
')"

distutils_enable_tests pytest
