# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Asynchronous gRPC with Asio/unified executors"
HOMEPAGE="https://github.com/Tradias/asio-grpc"
SRC_URI="https://github.com/Tradias/asio-grpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost
"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DASIO_GRPC_HUNTER_BACKEND_BOOST_ASIO=OFF
	)
	cmake_src_configure
}
