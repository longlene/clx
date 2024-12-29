# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Extensible task queue used in DVC"
HOMEPAGE="
	https://dvc.org/
	https://github.com/iterative/dvc-task
	https://pypi.org/project/dvc-task/
"
SRC_URI="https://github.com/iterative/dvc-task/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/celery-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/funcy-1.17[${PYTHON_USEDEP}]
	>=dev-python/kombu-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/shortuuid-1.0.8[${PYTHON_USEDEP}]
"
RESTRICT="test"
