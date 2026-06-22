# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A native plotting widget for Textual apps with zooming/panning support"
HOMEPAGE="
	https://pypi.org/project/textual-plot/
	https://github.com/davidfokkema/textual-plot
"
SRC_URI="https://github.com/davidfokkema/textual-plot/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/textual-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/textual-hires-canvas-0.14.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
