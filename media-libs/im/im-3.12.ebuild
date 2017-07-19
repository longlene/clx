# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib lua

DESCRIPTION="A toolkit for Digital Imaging"
HOMEPAGE="http://imtoolkit.sourceforge.net/"
SRC_URI="mirror://sourceforge/imtoolkit/${PV}/Docs%20and%20Sources/im-${PV}_Sources.tar.gz"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+openmp lua static-libs"

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/zlib
sys-libs/jasper
lua? ( >=dev-lang/lua-5.1 )"

S="${WORKDIR}"/${PN}

src_prepare() {
	find . -type d -exec chmod 755 {} \;
}

src_compile() {
	local target=" im "
	if use openmp; then
		target+=" im_process_omp "
	else
		target+=" im_process "
	fi
	target+=" im_fftw im_lzo "

	make -C src ${target}

	if use lua; then
		local luaver=$(lua -v 2>&1 | cut -d ' ' -f 2 | cut -d . -f1,2 | tr -d .)
		local cmd="make --no-print-directory -f ../tecmake.mak"
		cd ${S}/src
		${cmd} MF=imlua5 USE_LUA${luaver}=Yes
		${cmd} MF=imlua_jp2 USE_LUA${luaver}=Yes
		if use openmp; then
			${cmd} MF=imlua_process5 USE_OPENMP=Yes USE_LUA${luaver}=Yes
		else
			${cmd} MF=imlua_process5 USE_LUA${luaver}=Yes
		fi
		${cmd} MF=imlua_fftw5 USE_LUA${luaver}=Yes
	fi
}

src_install() {
	if use lua; then
		lua_install_cmodule lib/*/*lua*.so
		rm lib/*/*lua*.*
	fi
	dolib lib/*/*.so
	use static-libs && dolib lib/*/*.a

	insinto /usr/include/im
	doins include/*.h
}

