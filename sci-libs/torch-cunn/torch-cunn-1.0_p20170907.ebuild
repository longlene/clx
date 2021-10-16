# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

EGIT_COMMIT="1ae6aa08bd062bb609d126ca7a2d8f5411797b8c"

DESCRIPTION="Torch module for CUDA Neural Networks."
HOMEPAGE="https://github.com/torch/cunn"
SRC_URI="https://github.com/torch/cunn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-lang/lua-5.1:=
dev-lang/luajit:2
=sci-libs/torch7-9999
>=dev-util/nvidia-cuda-toolkit-7.0"
RDEPEND="${DEPEND}"

src_configure() {
	addwrite /dev

	local mycmakeargs=(
		"-DLUADIR=/usr/lib/lua/5.1"
		"-DLUADIR=/usr/share/lua/5.1"
		"-DLIBDIR=/usr/lib/lua/5.1"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/lib"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	mkdir -p "${D}"/usr/lib/lua/5.1 "${D}"/usr/share/lua/5.1
	mv "${D}"/usr/lib/* "${D}"/usr/lib/lua/5.1/
	mv "${D}"/usr/lua/* "${D}"/usr/share/lua/5.1/
	rm -rf "${D}"/usr/lua
}
