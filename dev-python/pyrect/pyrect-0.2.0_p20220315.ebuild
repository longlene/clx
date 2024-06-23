# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="fa7f10fcc77490a68b84e3e13eca7661948ce4bb"

DESCRIPTION="PyRect is a simple module with a Rect class for Pygame-like rectangular areas"
HOMEPAGE="https://github.com/asweigart/pyrect"
SRC_URI="https://github.com/asweigart/pyrect/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/PyRect-${EGIT_COMMIT}
