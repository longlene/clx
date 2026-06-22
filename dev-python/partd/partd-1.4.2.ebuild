# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Appendable key-value storage"
HOMEPAGE="
	https://github.com/dask/partd
	https://pypi.org/project/partd/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/locket[${PYTHON_USEDEP}]
		dev-python/toolz[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
