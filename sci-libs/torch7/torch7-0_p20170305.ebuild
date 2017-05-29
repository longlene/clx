# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="329dff5dc1ae5b90d6fc7a5d0f2f7c32403c6530"

DESCRIPTION="Torch is a Lua-based suite for scientific computations based on multidimensional tensors."
HOMEPAGE="https://github.com/torch/torch7"
SRC_URI="https://github.com/torch/torch7/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal cuda cudnn opencl"

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	virtual/blas
	virtual/lapack
	dev-lua/luafilesystem
	dev-lua/penlight
	dev-lua/lua-cjson
	dev-lua/torch-cwrap
	dev-lua/torch-paths
	sys-devel/gcc[fortran]
"
RDEPEND="${DEPEND}
!minimal? (
		sci-libs/torch-image
		sci-libs/torch-sys
		sci-libs/torch-nn
		sci-libs/torch-xlua
		sci-libs/torch-dok
		sci-libs/torch-optim
)
cuda? (
		sci-libs/torch-cutorch
		sci-libs/torch-cunn
)
cudnn? (
		sci-libs/torch-cudnn
)
opencl? (
		sci-libs/torch-cltorch
		sci-libs/torch-clnn
)"

REQUIRED_USE="cudnn? ( cuda )"

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
