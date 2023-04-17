# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An implementation of CBOR in C"
HOMEPAGE="https://github.com/libmcu/cbor"
SRC_URI="https://github.com/libmcu/cbor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dolib.a ${BUILD_DIR}/libcbor.a
	insinto /usr/include
	doins -r include/cbor
	einstalldocs
}
