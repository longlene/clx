# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( luajit )

inherit cmake lua-single vcs-snapshot

EGIT_COMMIT="dde9e56fb61eee040d7f3dba2331c6d6c095aee8"

DESCRIPTION="Torch is a Lua-based suite for scientific computations based on multidimensional tensors."
HOMEPAGE="https://github.com/torch/torch7"
SRC_URI="https://github.com/torch/torch7/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="minimal cuda cudnn opencl"

DEPEND="
	${LUA_DEPS}
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

#src_prepare() {
#	eapply_user
#	sed -i '/FILE(RELATIVE_PATH\ Torch_INSTALL_INCLUDE_SUBDIR/{s#${LUA_INCDIR}#/usr/include#}' cmake/TorchPaths.cmake || die
#}

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_lmod_dir)"
		"-DLIBDIR=$(lua_get_cmod_dir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=$(lua_get_include_dir)"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=$(lua_get_shared_lib)"
		"-DLUA=${LUA}"
	)
	cmake_src_configure
}
