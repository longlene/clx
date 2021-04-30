# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib lua

DESCRIPTION="CD (Canvas Draw) is a platform-independent graphics library"
HOMEPAGE="http://canvasdraw.sourceforge.net/"
SRC_URI="mirror://sourceforge/canvasdraw/${P}_Sources.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xft font pdf lua static-libs"

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/zlib
x11-libs/pangox-compat
media-libs/freetype
font? ( media-libs/ftgl )
x11-libs/libX11
x11-libs/libXpm
x11-libs/libXmu
xft? ( x11-libs/libXft )
pdf? ( media-libs/pdflib )
x11-libs/gtk+:2
lua? ( dev-lang/lua )
media-libs/im"

S="${WORKDIR}"/${PN}

src_compile() {
	local target=" cd "
	use pdf && target+=" cdpdf "
	use font && target+=" cdgl "
	target+=" cdx11 cdcontextplus "
	make -C src ${target}

	if use lua; then
		local luaver=$(lua -v 2>&1 | cut -d ' ' -f 2 | cut -d . -f1,2 | tr -d .)
		local cmd="make --no-print-directory -f ../tecmake.mak"
		cd ${S}/src
		${cmd} MF=cdlua5 USE_LUA${luaver}=Yes
		use pdf && ${cmd} MF=cdluapdf5 USE_LUA${luaver}=Yes
		use font && ${cmd} MF=cdluagl5 USE_LUA${luaver}=Yes
		${cmd} MF=cdluacontextplus5 USE_LUA${luaver}=Yes
		${cmd} MF=cdluaim5 USE_LUA${luaver}=Yes
	fi
}

src_install() {
	if use lua; then
		lua_install_cmodule lib/*/*lua*.so
		rm  lib/*/*lua*.*
	fi
	dolib lib/*/*.so
	use static-libs && dolib lib/*/*.a

	insinto /usr/include/cd
	doins include/*.h
}
