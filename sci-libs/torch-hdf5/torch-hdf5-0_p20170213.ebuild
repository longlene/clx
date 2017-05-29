# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="abbb9bda2ec47a19c7ef81c630027847c03b6b6f"

DESCRIPTION="Torch interface to HDF5 library"
HOMEPAGE="https://github.com/deepmind/torch-hdf5"
SRC_URI="https://github.com/deepmind/torch-hdf5/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	sci-libs/torch7
	sci-libs/hdf5
	dev-lua/penlight
	dev-lua/torch-totem
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "/WRITE/{s#\${CMAKE_INSTALL_PREFIX}/\${Torch_INSTALL_LUA_PATH_SUBDIR}#${D}usr/lua#}" CMakeLists.txt
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

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	dodir $(lua_get_sharedir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}
