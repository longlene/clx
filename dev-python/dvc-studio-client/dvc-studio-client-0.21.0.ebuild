# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Small library to post data from DVC/DVCLive to Iterative Studio"
HOMEPAGE="
	https://dvc.org/
	https://github.com/iterative/dvc-studio-client
	https://pypi.org/project/dvc-studio-client/
"
SRC_URI="https://github.com/iterative/dvc-studio-client/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/dulwich[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"
RESTRICT="test"
