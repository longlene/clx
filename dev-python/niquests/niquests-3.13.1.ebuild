# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A simple, yet elegant, HTTP library"
HOMEPAGE="
	https://pypi.org/project/niquests/
	https://github.com/jawah/niquests/
"
SRC_URI="https://github.com/jawah/niquests/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/charset-normalizer-2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-future-2.12.900[${PYTHON_USEDEP}]
	>=dev-python/wassima-1.0.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
