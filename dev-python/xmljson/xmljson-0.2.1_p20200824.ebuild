# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11,12} )

inherit distutils-r1

EGIT_COMMIT="20817db7eecd057b23ed7055d32bb339c3c5a496"

DESCRIPTION="xmlsjon converts XML into Python dictionary structures"
HOMEPAGE="https://github.com/sanand0/xmljson"
SRC_URI="https://github.com/sanand0/xmljson/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
	test? (
		dev-python/lxml[${PYTHON_USEDEP}]
	)
"

#distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
