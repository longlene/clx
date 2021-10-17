# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="7e50ba93600a143e8ed03cb18cf577c954a0cdcb"

DESCRIPTION="Open Neural Networks Library"
HOMEPAGE="http://www.opennn.net"
SRC_URI="https://github.com/Artelnics/OpenNN/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mpi"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/add_subdirectory/{/example/d}' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-D__OPENNN_MPI__=$(usex mpi)
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include/opennn
	doins opennn/*.h
	dolib.a ${BUILD_DIR}/opennn/libopennn.a
	dodoc README.md
}
