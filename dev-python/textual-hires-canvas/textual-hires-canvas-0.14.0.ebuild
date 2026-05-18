# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="High-resolution drawing canvas for Textual apps"
HOMEPAGE="
	https://pypi.org/project/textual-hires-canvas/
	https://github.com/davidfokkema/textual-hires-canvas
"
SRC_URI="https://github.com/davidfokkema/textual-hires-canvas/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/textual-6.2.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
