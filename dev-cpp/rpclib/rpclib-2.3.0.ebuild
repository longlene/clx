# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="rpclib is a modern C++ msgpack-RPC server and client library"
HOMEPAGE="http://rpclib.net"
SRC_URI="https://github.com/rpclib/rpclib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DRPCLIB_BUILD_TESTS=$(usex test)
	-DRPCLIB_ENABLE_EXAMPLES=$(usex example)
	)
	cmake_src_configure
}

