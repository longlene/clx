# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

PYBIND11_COMMIT="a2e59f0e7065404b44dfe92a28aca47ba1378dc4"

DESCRIPTION="Python bindings for ICU4C"
HOMEPAGE="
	https://pypi.org/project/icupy/
	https://github.com/miute/icupy
"
SRC_URI="
	https://github.com/miute/icupy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/pybind/pybind11/archive/${PYBIND11_COMMIT}.tar.gz -> pybind11-${PYBIND11_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/tomli[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	default
	rmdir src/third_party/pybind11 && ln -sv "${WORKDIR}"/pybind11-${PYBIND11_COMMIT} src/third_party/pybind11
}
