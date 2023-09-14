# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake lua vcs-snapshot

EGIT_COMMIT="acb15e2d64bfc9e61d436eb207363ec66a81a1d6"

DESCRIPTION="Torch module for CUDA."
HOMEPAGE="https://github.com/torch/cutorch"
SRC_URI="https://github.com/torch/cutorch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	sci-libs/torch7
	>=dev-util/nvidia-cuda-toolkit-7.0"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's#-Werror=implicit-function-declaration##' CMakeLists.txt
}

src_configure() {
	addwrite /dev

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
	rm -f /dev/nvidia-uvm

	cmake_src_install
	dodir $(lua_get_libdir) $(lua_get_sharedir)
	mv "${D}"/usr/lib/libcutorch.so "${D}"/$(lua_get_libdir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}
