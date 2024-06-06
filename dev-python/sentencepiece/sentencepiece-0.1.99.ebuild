# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Unsupervised text tokenizer for Neural Network-based text generation"
HOMEPAGE="https://github.com/google/sentencepiece"
SRC_URI="https://github.com/google/sentencepiece/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="sci-libs/sentencepiece"

distutils_enable_tests pytest

S="${WORKDIR}"/${P}/python

src_prepare() {
	default
	rm "${WORKDIR}"/${P}/CMakeLists.txt # use system lib
	distutils-r1_src_prepare
}

src_install() {
	distutils-r1_src_install
	rm "${D}"/usr/share/doc/${P}/README.md*
}
