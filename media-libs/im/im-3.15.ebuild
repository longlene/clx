# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} )

inherit lua

DESCRIPTION="A toolkit for Digital Imaging"
HOMEPAGE="http://imtoolkit.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/project/imtoolkit/${PV}/Docs%20and%20Sources/${P}_Sources.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lua static-libs"

DEPEND="
	lua? ( ${LUA_DEPS} )
"
RDEPEND="${DEPEND}
	media-libs/libpng
	sci-libs/fftw
	sys-libs/zlib
"

S="${WORKDIR}"/${PN}

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

src_prepare() {
	default
	sed -i 's/^im_.*/\0 im/g;s/^im_fftw3.*/\0 im_process/g;s/^imlua_.*/\0 imlua5/g' src/Makefile
}

lua_src_compile() {
	local target=(
		imlua5
		imlua_jp25
		imlua_process5
		imlua_process_omp5
		imlua_fftw35
	)
	local VER=$(ver_cut 1-2 $(lua_get_version))
	emake -C src USE_LUA$(ver_rs 1- '' ${VER})=Yes LUA_SFX=${VER} LUA_INC=$(lua_get_include_dir) ${target[@]}
}

src_compile() {
	local target=(
		im
		im_jp2
		im_process
		im_process_omp
		im_fftw3
	)
	emake -C src ${target[@]}

	if use lua; then
		lua_foreach_impl lua_src_compile
	fi
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins lib/Linux*/Lua*/libimlua*.so
}

src_install() {
	dolib.so lib/Linux*/*.so
	use static-libs && dolib.a lib/Linux*/*.a

	insinto /usr/include/im
	doins include/*.h
	if use lua; then
		lua_foreach_impl lua_src_install
	fi
}

