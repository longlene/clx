# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

EGIT_COMMIT="013b23b4bb35b4672f9fabdbc4253befff595ac7"

DESCRIPTION="zlib for the next generation systems"
HOMEPAGE="https://github.com/Dead2/zlib-ng"
SRC_URI="https://github.com/Dead2/zlib-ng/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "/set(/{s#\${CMAKE_INSTALL_PREFIX}/lib#\${CMAKE_INSTALL_PREFIX}/$(get_libdir)#}" -i CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DZLIB_ENABLE_TESTS=OFF
	)
	cmake_src_configure
}
