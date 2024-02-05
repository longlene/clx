# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="59d5d67c637624c0e5952527c69e71a536d919d9"

DESCRIPTION="CBOR C++ serialization library"
HOMEPAGE="https://github.com/erigontech/cbor-cpp"
SRC_URI="https://github.com/erigontech/cbor-cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dolib.so ${BUILD_DIR}/libcborcpp.so
	insinto /usr/include
	doins cbor/cbor.h
	insinto /usr/include/cbor
	doins cbor/{input,encoder,decoder,listener,output_static,output_dynamic,listener_debug}.h
	dodoc README.md
}
