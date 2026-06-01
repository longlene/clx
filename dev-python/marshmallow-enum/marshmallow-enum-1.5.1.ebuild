# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Enum field for marshmallow"
HOMEPAGE="https://pypi.org/project/marshmallow-enum/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/marshmallow-2.0.0[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4[${PYTHON_USEDEP}]
"
