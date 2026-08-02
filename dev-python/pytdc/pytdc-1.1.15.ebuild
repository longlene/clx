# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Therapeutics Commons"
HOMEPAGE="https://pypi.org/project/pytdc/"

LICENSE="TODO"
SLOT="0"
KEYWORDS="~amd64"
