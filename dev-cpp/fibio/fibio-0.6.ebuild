# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Fiber and async I/O based network library"
HOMEPAGE="http://fiberized.io"
SRC_URI="https://github.com/windoze/fibio/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DWITH_REDIS=OFF
	-DWITH_THRIFT=OFF
	-DWITH_MYSQL=OFF
	-DWITH_CASSANDRA=OFF
	-DWITH_VALGRIND=OFF
	)
	cmake_src_configure
}
