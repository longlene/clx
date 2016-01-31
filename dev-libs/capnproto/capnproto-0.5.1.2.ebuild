# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Cap'n Proto serialization/RPC system"
HOMEPAGE="https://github.com/sandstorm-io/capnproto"
SRC_URI="mirror://github/sandstorm-io/capnproto/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+tools test lite"

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/c++

src_prepare() {
	sed -i "/LIB_INSTALL_DIR/ s/lib/$(get_libdir)/" c++/CMakeLists.txt
	sed -i '/create_symlink/d' c++/src/capnp/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DCMAKE_INSTALL_PREFIX=/usr
	$(cmake-utils_use_build tools TOOLS)
	$(cmake-utils_use_build test TESTING)
	$(cmake-utils_use lite CAPNP_LITE)
	)
	cmake-utils_src_configure
}
