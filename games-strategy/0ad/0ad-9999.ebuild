# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils wxwidgets subversion games flag-o-matic

ESVN_REPO_URI="http://svn.wildfiregames.com/public/ps/trunk"

DESCRIPTION="0 A.D. is a free, real-time strategy game currently under development by Wildfire Games."
HOMEPAGE="http://wildfiregames.com/0ad/"

LICENSE="GPL-2 CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="editor"

RDEPEND="virtual/opengl
		dev-lang/spidermonkey[threadsafe]
		media-libs/openal
		dev-libs/crypto++
		media-libs/libsdl
		dev-libs/boost
		sys-libs/zlib
		|| ( dev-libs/libgamin app-admin/fam )
		dev-libs/xerces-c
		editor? ( x11-libs/wxGTK:2.8 )
		media-libs/devil
		net-libs/enet
		media-video/ffmpeg
		media-libs/jpeg
		media-libs/libpng
		dev-libs/libxml2
		media-libs/libvorbis
		media-libs/libogg
		dev-util/valgrind"

DEPEND="${RDEPEND}
	dev-lang/nasm"

RESTRICT="strip"

dir=${GAMES_PREFIX_OPT}/${PN}
Ddir="${D}/${dir}"

pkg_setup() {
	append-ldflags -Wl,--no-as-needed
	games_pkg_setup
	WX_GTK_VER=2.8 need-wxwidgets unicode
}

src_unpack() {
	subversion_src_unpack
	rm -rf "${S}"/binaries/system/*
}

src_compile() {
	if ! use editor; then
		sed -i "s:--atlas::" "${S}/build/workspaces/update-workspaces.sh" \
		|| die "AtlasUI sed failed"
	fi

	cd "${S}/libraries/fcollada/src"
	emake || die "Can't build fcollada"
	cd "${S}/build/workspaces"
	./update-workspaces.sh
	cd gcc
	emake || die "Can't build"
}

src_install() {
	cd "${S}"/binaries/
	insinto "${dir}"
	doins -r data logs || die "doins -r failed"

	exeinto "${dir}"/system
	doexe "${S}"/binaries/system/{pyrogenesis_dbg,test_dbg} || die "doexe failed"

	insinto "${dir}"/system
	doins "${S}"/binaries/system/{*.a,*.so} || die	"doins failed"

	games_make_wrapper ${PN} ./system/pyrogenesis_dbg ${dir}
#	make_desktop_entry "${dir}"/system/pyrogenesis_dbg "0 A.D."

	prepgamesdirs
	chmod g+rw "${Ddir}/logs" "${Ddir}/data/cache"
}
