# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )
DISTUTILS_EXT=1

inherit distutils-r1
LS_QPACK_COMMIT="dcaace0e2fefe62751247051cb10cbf5b05ddfd3"

DESCRIPTION="Python wrapper for the ls-qpack QPACK library"
HOMEPAGE="https://github.com/aiortc/pylsqpack"
SRC_URI="
	https://github.com/aiortc/pylsqpack/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/litespeedtech/ls-qpack/archive/${LS_QPACK_COMMIT}.tar.gz -> ls-qpack-${LS_QPACK_COMMIT}.tar.gz
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND=""

RESTRICT="test"

src_prepare() {
	default
	rmdir vendor/ls-qpack && mv "${WORKDIR}"/ls-qpack-${LS_QPACK_COMMIT} vendor/ls-qpack
	distutils-r1_src_prepare
}
