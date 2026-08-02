# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="An API wrapper for IGDB API v4"
HOMEPAGE="https://github.com/twitchtv/igdb-api-python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
"
