# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++11 Redis Client"
HOMEPAGE="https://github.com/Cylix/cpp_redis"
SRC_URI="https://github.com/Cylix/cpp_redis/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/install/{/${CMAKE_BINARY_DIR}\/bin/d}' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DUSE_CUSTOM_TCP_CLIENT=true
	)
	cmake_src_configure
}
