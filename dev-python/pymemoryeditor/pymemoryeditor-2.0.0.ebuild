# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Read, write and scan process memory in a few lines of Python"
HOMEPAGE="https://github.com/JeanExtreme002/PyMemoryEditor https://pymemoryeditor.readthedocs.io"
SRC_URI="https://github.com/JeanExtreme002/PyMemoryEditor/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/PyMemoryEditor-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="app speed"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	app? (
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyside[${PYTHON_USEDEP}]
	)
	speed? ( dev-python/numpy[${PYTHON_USEDEP}] )
')"
BDEPEND="$(python_gen_cond_dep '
	>=dev-python/hatchling-1.27[${PYTHON_USEDEP}]
')"
