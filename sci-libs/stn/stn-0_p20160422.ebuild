# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake lua vcs-snapshot

EGIT_COMMIT="88e7a83dc1b55fd032aaccd39597e5ca32ab4b7f"

DESCRIPTION="Spatial Transformer Networks for Torch"
HOMEPAGE="https://github.com/qassemoquab/stnbhwd"
SRC_URI="https://github.com/qassemoquab/stnbhwd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

DEPEND="
	sci-libs/torch7[cuda?]
	sci-libs/torch-nn
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use cuda || sed -i '/FIND_PACKAGE(CUDA/,$ d' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_sharedir)"
		"-DLIBDIR=$(lua_get_libdir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodir $(lua_get_sharedir) $(lua_get_libdir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	mv "${D}"/usr/lib/* "${D}"/$(lua_get_libdir)
	rm -rf "${D}"/usr/lua
}
