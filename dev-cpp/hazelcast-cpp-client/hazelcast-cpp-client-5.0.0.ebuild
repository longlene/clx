# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hazelcast IMDG C++ Client"
HOMEPAGE="https://github.com/hazelcast/hazelcast-cpp-client"
SRC_URI="https://github.com/hazelcast/hazelcast-cpp-client/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ssl"

DEPEND="
	dev-libs/boost
	ssl? ( dev-libs/openssl )

"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DWITH_OPENSSL=$(usex ssl)
	)
	cmake_src_configure
}
