# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="8dd911d0156ee62f308bbbd3e6bd6586efc433f1"

DESCRIPTION="Torch FFI bindings for nvidia-cuda-cudnn."
HOMEPAGE="https://github.com/soumith/cudnn.torch"
SRC_URI="https://github.com/soumith/cudnn.torch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sci-libs/torch7
	>=dev-libs/nvidia-cuda-cudnn-7.0
"
RDEPEND="${DEPEND}"

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
	mv "${D}"/usr/lua/* "${D}"$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}
