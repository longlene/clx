# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="2464adadf28c1b924416831d24ca62380936a209"

DESCRIPTION="TLS 1.3 implementation in C"
HOMEPAGE="https://github.com/h2o/picotls"
SRC_URI="
	https://github.com/h2o/picotls/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/h2o/picotest/archive/3808f02c507f4dfeeb785576d4e36971d1c97f83.tar.gz -> picotest-0_p20190324.tar.gz
	"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

DEPEND="${DEPEND}
	ssl? ( dev-libs/openssl )
"
RDEPEND=""
BDEPEND=""

src_prepare() {
	default
	mv "${WORKDIR}"/picotest-0_p20190324/picotest.{c,h} deps/picotest/
	cmake-utils_src_prepare
}

src_install() {
	dolib.so ${BUILD_DIR}/libpicotls-{core,minicrypto}.so
	use ssl && dolib.so ${BUILD_DIR}/libpicotls-openssl.so
	insinto /usr/include
	doins -r include/picotls{,.h}
	dodoc README.md
}
