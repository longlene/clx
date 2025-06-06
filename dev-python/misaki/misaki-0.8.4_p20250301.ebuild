# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="14675cc09b1db6e452bd1114435ffcd3a1f0e770"

DESCRIPTION="A G2P engine designed for Kokoro models"
HOMEPAGE="
	https://pypi.org/project/misaki/
	https://github.com/hexgrad/misaki
"
SRC_URI="https://github.com/hexgrad/misaki/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/regex[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
