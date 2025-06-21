# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A two line search engine"
HOMEPAGE="
	https://pypi.org/project/rank-bm25/
	https://github.com/dorianbrown/rank_bm25
"
SRC_URI="https://github.com/dorianbrown/rank_bm25/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/rank_bm25-${PV}

src_prepare() {
	default
	echo "Version: ${PV}" > PKG-INFO
	distutils-r1_src_prepare
}
