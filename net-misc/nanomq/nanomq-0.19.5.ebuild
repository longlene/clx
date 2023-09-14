# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic

NNG_COMMIT="ba49e03a8a8367cf891aec89e9f3114e949c0200"

DESCRIPTION="Nano MQTT Broker"
HOMEPAGE="https://nanomq.io/"
SRC_URI="
	https://github.com/nanomq/nanomq/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/nanomq/NanoNNG/archive/${NNG_COMMIT}.tar.gz -> NanoNNG-${NNG_COMMIT}.tar.gz
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
	ln -sv "${WORKDIR}"/NanoNNG-${NNG_COMMIT} nng
	cmake_src_prepare
}

src_configure() {
	append-ldflags "-pthread"
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DNNG_TESTS=OFF
		-DNNG_TOOLS=OFF
		-DNNG_ENABLE_NNGCAT=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/nanomq/nanomq
	dodoc README.md
}
