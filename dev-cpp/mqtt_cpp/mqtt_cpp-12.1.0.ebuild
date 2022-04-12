# Copyright 1998-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="MQTT client for C++14 based on Boost.Asio"
HOMEPAGE="https://github.com/redboltz/mqtt_cpp"
SRC_URI="https://github.com/redboltz/mqtt_cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

DEPEND="
	dev-cpp/beast
	dev-libs/boost[threads]
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DMQTT_NO_TLS=$(usex !ssl)
	-DBoost_USE_STATIC_LIBS=OFF
	-DMQTT_BEAST_INCLUDE_DIR=/usr/include
	)
	cmake_src_configure
}
