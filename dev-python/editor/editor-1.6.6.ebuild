# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Open the default text editor"
HOMEPAGE="
	https://github.com/rec/editor/
	https://pypi.org/project/editor/
"
SRC_URI="https://github.com/rec/editor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/runs[${PYTHON_USEDEP}]
	dev-python/xmod[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/tdir[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
