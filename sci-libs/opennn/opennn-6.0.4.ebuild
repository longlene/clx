# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Open Neural Networks Library"
HOMEPAGE="http://www.opennn.net"
SRC_URI="https://github.com/Artelnics/OpenNN/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mpi"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DOpenNN_BUILD_EXAMPLES=OFF
		-DOpenNN_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include/opennn
	doins opennn/*.h
	dolib.so ${BUILD_DIR}/opennn/libopennn.so
	einstalldocs
}
