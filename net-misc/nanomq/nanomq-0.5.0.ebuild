# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils flag-o-matic

DESCRIPTION="Nano MQTT Broker"
HOMEPAGE="https://nanomq.io/"
SRC_URI="
	https://github.com/nanomq/nanomq/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/nanomq/nng/archive/a29379751139bd1739627196f51bcdd8da72640b.tar.gz -> nng-a29379751139bd1739627196f51bcdd8da72640b.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir nng
	ln -sv "${WORKDIR}"/nng-a29379751139bd1739627196f51bcdd8da72640b nng
	cmake-utils_src_prepare
}

src_configure() {
	append-ldflags "-pthread"
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DNNG_TESTS=OFF
		-DNNG_TOOLS=OFF
		-DNNG_ENABLE_NNGCAT=OFF
	)
	cmake-utils_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/nanomq/nanomq
	dodoc README.md
}
