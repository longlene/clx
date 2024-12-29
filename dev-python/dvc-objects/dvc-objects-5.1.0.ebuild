# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="filesystem and object-db level abstractions to use in dvc and dvc-data"
HOMEPAGE="
	https://dvc.org/
	https://github.com/iterative/dvc-objects
	https://pypi.org/project/dvc-objects/
"
SRC_URI="https://github.com/iterative/dvc-objects/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/fsspec[${PYTHON_USEDEP}]
"
RESTRICT="test"
