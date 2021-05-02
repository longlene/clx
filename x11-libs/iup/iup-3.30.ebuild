# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib lua

DESCRIPTION="IUP is a multi-platform toolkit for building graphical user interfaces"
HOMEPAGE="http://iup.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}_Sources.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="webkit static-libs lua opengl lua motif led"

DEPEND=""
RDEPEND="${DEPEND}
	x11-libs/pangox-compat
	webkit? ( net-libs/webkit-gtk )
	motif? ( x11-libs/motif x11-proto/printproto )
	opengl? ( virtual/glu )
	lua? ( >=dev-lang/lua-5.1 )
"

S="${WORKDIR}"/${PN}

src_prepare() {
	find . -type d -exec chmod 755 {} \;
}

src_compile() {

	local myiupconf="NO_DEPEND=Yes GTK_DEFAULT=Yes "
	make iup iupcd iupcontrols ${myiupconf}
	use opengl && make iupgl iup_mglplot iupglcontrols
	make iup_pplot iup_scintilla iupim iupimglib
	use webkit && make iupweb
	make iuptuio ledc
	# iupview need many static-libs

	if use lua; then
		local luaver=$(lua -v 2>&1 | cut -d ' ' -f 2 | cut -d . -f1,2 | tr -d .)
		local cmd="make --no-print-directory -f ../tecmake.mak"
		cd ${S}/srclua5
		${cmd} USE_LUA${luaver}=Yes
		${cmd} MF=iupcd USE_LUA${luaver}=Yes
		${cmd} MF=iupcontrols USE_LUA${luaver}=Yes
		${cmd} MF=iup_pplot USE_LUA${luaver}=Yes
		if use opengl; then
			${cmd} MF=iupgl USE_LUA${luaver}=Yes
			${cmd} MF=iupglcontrols USE_LUA${luaver}=Yes
			${cmd} MF=iup_mglplot USE_LUA${luaver}=Yes
		fi
		${cmd} MF=iup_scintilla USE_LUA${luaver}=Yes
		${cmd} MF=iupim USE_LUA${luaver}=Yes
		${cmd} MF=iupimglib USE_LUA${luaver}=Yes
		${cmd} MF=iuptuio USE_LUA${luaver}=Yes

		cd ${S}/srcconsole
		${cmd} USE_LUA${luaver}=Yes
		${cmd} USE_GTK=Yes
	fi
}

src_install() {
	if use lua; then
		lua_install_cmodule lib/*/*lua*.so
	fi
	rm lib/*/*lua*.*
	dolib lib/*/*.so
	use static-libs && dolib lib/*/*.a

	insinto /usr/include/iup
	doins include/*.h

	if use led; then
		dobin bin/*/ledc
	fi
}
