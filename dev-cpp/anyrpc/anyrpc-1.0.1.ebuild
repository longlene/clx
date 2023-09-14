# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Support for multiple RPC protocols in a single library"
HOMEPAGE="https://github.com/sgieseking/anyrpc"
SRC_URI="https://github.com/sgieseking/anyrpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" -i src/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_EXAMPLES=OFF
	-DBUILD_WITH_LOG4CPLUS=OFF
	)
	cmake_src_configure
}
