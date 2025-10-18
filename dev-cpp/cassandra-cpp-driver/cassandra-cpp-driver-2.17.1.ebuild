# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="DataStax C/C++ Driver for Cassandra"
HOMEPAGE="https://datastax.github.io/cpp-driver/"
SRC_URI="https://github.com/datastax/cpp-driver/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

RDEPEND="
	dev-libs/libuv:=
	ssl? (
		dev-libs/openssl:0=
	)"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/cpp-driver-${PV}

src_prepare() {
	default
	sed -e "s#-Wall ##" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_FLAGS="-Wno-error"
		-DCASS_USE_OPENSSL=$(usex ssl)
		-DCASS_USE_STD_ATOMIC=ON
	)
	cmake_src_configure
}
