# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

EGIT_COMMIT="fb444d4e6f01a136c0369bc01452082abf0f0d3c"

DESCRIPTION="A simple text splitter based on Tortoise for use in text-to-speech applications"
HOMEPAGE="
	https://pypi.org/project/txtsplit/
	https://github.com/fakerybakery/txtsplit
"
SRC_URI="https://github.com/fakerybakery/txtsplit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
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
