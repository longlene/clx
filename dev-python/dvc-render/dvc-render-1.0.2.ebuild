# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Dvc Render"
HOMEPAGE="
	https://dvc.org/
	https://github.com/iterative/dvc-render
	https://pypi.org/project/dvc-render/
"
SRC_URI="https://github.com/iterative/dvc-render/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
RESTRICT="test"
