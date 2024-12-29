# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="HTTP plugin for dvc"
HOMEPAGE="
	https://dvc.org/
	https://github.com/iterative/dvc-http
	https://pypi.org/project/dvc-http/
"
SRC_URI="https://github.com/iterative/dvc-http/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/dvc[${PYTHON_USEDEP}]
	dev-python/fsspec[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.5.0[${PYTHON_USEDEP}]
"
RESTRICT="test"
