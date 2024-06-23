# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="eeca245a135cf171c163b3691300138518efa64e"

DESCRIPTION="PyScreeze is a simple, cross-platform screenshot module for Python"
HOMEPAGE="https://github.com/asweigart/pyscreeze"
SRC_URI="https://github.com/asweigart/pyscreeze/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pillow-9.3.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
