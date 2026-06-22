# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Get the unique machine ID of any host (without admin privileges)"
HOMEPAGE="https://github.com/keygen-sh/py-machineid https://pypi.org/project/py-machineid/"

# sdist extracts to py-machineid-${PV}/ (hyphens), pypi eclass normalizes to underscores
S="${WORKDIR}/py-machineid-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"
