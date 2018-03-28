# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils multilib-minimal

DESCRIPTION="A high performance, open source, general RPC framework"
HOMEPAGE="http://www.grpc.io/"
SRC_URI="https://github.com/grpc/grpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/gflags
	dev-libs/openssl
	dev-libs/protobuf
	dev-util/re2c
	>=net-dns/c-ares-1.14.0-r1
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

multilib_src_configure() {
	local mycmakeargs=(
	-DLIB_INSTALL_DIR=/usr/$(get_libdir)
	-DgRPC_INSTALL_LIBDIR=$(get_libdir)
	-DgRPC_ZLIB_PROVIDER=package
	-DgRPC_SSL_PROVIDER=package
	-DgRPC_PROTOBUF_PROVIDER=package
	-DgRPC_GFLAGS_PROVIDER=package
	-DgRPC_CARES_PROVIDER=package
	-DgRPC_BENCHMARK_PROVIDER=package
	)
	cmake-utils_src_configure
}
