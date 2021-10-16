# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="A high performance/ real-time C++ Kafka streams framework"
HOMEPAGE="https://github.com/bitbouncer/kspp"
SRC_URI="https://github.com/bitbouncer/kspp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/avro-cpp
	dev-libs/boost
	dev-libs/rapidjson
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DENABLE_ROCKSDB=OFF
	-DENABLE_POSTGRES=OFF
	-DENABLE_INFLUXDB=OFF
	-DENABLE_TDS=OFF
	-DENABLE_ELASTICSEARCH=OFF
	-DBUILD_TOOLS=OFF
	-DBUILD_SAMPLES=OFF
	-DBUILD_TESTS=OFF
	)
	cmake_src_configure
}
