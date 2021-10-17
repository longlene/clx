# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake lua vcs-snapshot

EGIT_COMMIT="83a5f17e9f4fa469a3e910d0ec75833239d7ffdf"

DESCRIPTION="A recurrent neural network library for Torch"
HOMEPAGE="https://github.com/torch/rnn"
SRC_URI="https://github.com/torch/rnn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="opencl cuda"

DEPEND="
	dev-lua/moses
	sci-libs/torch7
	sci-libs/torch-nn
	sci-libs/torchx
	cuda? (
		sci-libs/torch-cutorch
		sci-libs/torch-cunn
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	use cuda && CUDA=YES
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_sharedir)"
		"-DLIBDIR=$(lua_get_libdir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/$(get_libdir)/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodir $(lua_get_sharedir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}
