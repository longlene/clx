# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

EGIT_COMMIT="944b7cdc67058d005ce5fd011c66f2d87d25aba0"

DESCRIPTION="Simple, cross-platform, pure Python module to display message boxes"
HOMEPAGE="https://github.com/asweigart/pymsgbox"
SRC_URI="https://github.com/asweigart/pymsgbox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
