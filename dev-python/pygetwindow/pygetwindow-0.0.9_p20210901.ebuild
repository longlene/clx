# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="c5f3070324609e682d082ed53122a36002a3e293"

DESCRIPTION="A simple, cross-platform module for obtaining GUI information on applications' windows"
HOMEPAGE="https://github.com/asweigart/pygetwindow"
SRC_URI="https://github.com/asweigart/pygetwindow/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyrect[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/PyGetWindow-${EGIT_COMMIT}
