# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="light-weight brokerless messaging"
HOMEPAGE="https://github.com/nanomsg/nng"
SRC_URI="https://github.com/nanomsg/nng/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tls"

DEPEND="
	tls? ( net-libs/mbedtls )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DNNG_ENABLE_TLS=$(usex tls)
		-DNNG_TESTS=OFF
	)
	cmake_src_configure
}
