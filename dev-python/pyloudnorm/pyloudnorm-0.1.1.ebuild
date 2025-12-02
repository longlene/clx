# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Implementation of ITU-R BS.1770-4 loudness algorithm in Python"
HOMEPAGE="
	https://github.com/csteinmetz1/pyloudnorm
	https://pypi.org/project/pyloudnorm/
"
SRC_URI="https://github.com/csteinmetz1/pyloudnorm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/scipy-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	default
	rm pyproject.toml
}
