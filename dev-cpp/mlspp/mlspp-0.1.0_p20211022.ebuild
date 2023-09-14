# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="90cc8cbf314e145bd3ace59f8f5f84a71626ef0f"

DESCRIPTION="Implementation of Messaging Layer Security"
HOMEPAGE="https://github.com/cisco/mlspp"
SRC_URI="https://github.com/cisco/mlspp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/mls
	dolib.so ${BUILD_DIR}/libmlspp.so ${BUILD_DIR}/lib/bytes/libbytes.so ${BUILD_DIR}/lib/hpke/libhpke.so ${BUILD_DIR}/lib/tls_syntax/libtls_syntax.so ${BUILD_DIR}/lib/mls_vectors/libmls_vectors.so
	dodoc README.md
}
