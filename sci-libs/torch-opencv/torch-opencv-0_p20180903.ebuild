# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake lua vcs-snapshot

EGIT_COMMIT="389fe4f029ef790b4ed22b1ac7abef3f210ebc0f"

DESCRIPTION="OpenCV bindings for Torch"
HOMEPAGE="https://github.com/VisionLabs/torch-opencv"
SRC_URI="https://github.com/VisionLabs/torch-opencv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	>=media-libs/opencv-3.1.0
	sci-libs/torch7
	cuda? ( >=dev-util/nvidia-cuda-toolkit-7.0 )
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/FIND_PACKAGE/{s#3.1#3.3.0#}' CMakeLists.txt
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
		-DBUILD_CUDA=$(usex cuda)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodir $(lua_get_sharedir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}
