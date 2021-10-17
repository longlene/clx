# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++ TCP Library"
HOMEPAGE="https://github.com/Cylix/tacopie"
SRC_URI="https://github.com/Cylix/tacopie/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	if ! use example && ! use test ; then
		sed -i '/install/{/${CMAKE_BINARY_DIR}\/bin/d}' CMakeLists.txt
	fi
	sed -e '/install(DIRECTORY DESTINATION ${CMAKE_BINARY_DIR}\/lib\/)/d' \
		-e '/install(DIRECTORY DESTINATION ${CMAKE_BINARY_DIR}\/bin\/)/d' \
		-i CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_EXAMPLES=$(usex example)
	-DBUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}
