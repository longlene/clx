# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="4153583eaeeadd88212a69ab5fa61a41283ae59b"

DESCRIPTION="Standalone Language Identification (LangID) tool"
HOMEPAGE="
	https://pypi.org/project/langid/
	https://github.com/saffsd/langid.py
"
SRC_URI="https://github.com/saffsd/langid.py/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/langid.py-${EGIT_COMMIT}
