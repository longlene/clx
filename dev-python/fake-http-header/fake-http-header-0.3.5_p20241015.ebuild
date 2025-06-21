# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

EGIT_COMMIT="c684b6e1fca568b6a9794aea4cd5e8eb91c7c940"

DESCRIPTION="A python package to generate random request fields for a http header"
HOMEPAGE="
	https://pypi.org/project/fake-http-header/
	https://github.com/MichaelTatarski/fake-http-header
"
SRC_URI="https://github.com/MichaelTatarski/fake-http-header/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
