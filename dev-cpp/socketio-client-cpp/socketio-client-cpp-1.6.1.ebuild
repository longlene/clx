# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="C++11 implementation of Socket.IO client"
HOMEPAGE="https://github.com/socketio/socket.io-client-cpp"
SRC_URI="https://github.com/socketio/socket.io-client-cpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND="
	dev-libs/boost
"
RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE=Release

src_configure() {
	local mycmakeargs=(
	-DBUILD_SHARED_LIBS=$(usex !static)
	-DBoost_USE_STATIC_LIBS=OFF
	)
	cmake-utils_src_configure
}
