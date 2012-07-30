# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

ESVN_REPO_URI="https://pcsxr.svn.codeplex.com/svn/pcsxr"
ESVN_PROJECT="pcsxr"

inherit eutils autotools games subversion

DESCRIPTION="PCSX-Reloaded: a fork of PCSX, the discontinued Playstation emulator"
HOMEPAGE="http://pcsxr.codeplex.com"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="alsa opengl"

RDEPEND="x11-libs/gtk+:2
	gnome-base/libglade
	media-libs/libsdl
	sys-libs/zlib
	app-arch/bzip2
	x11-libs/libXv
	x11-libs/libXtst
	alsa? ( media-libs/alsa-lib )
	opengl? ( virtual/opengl
	x11-libs/libXxf86vm )"

DEPEND="${RDEPEND}
	!games-emulation/pcsx
	!games-emulation/pcsx-df
	x86? ( dev-lang/nasm )"

src_prepare() {
	# fix plugin path
	for i in $(grep -irl 'games/psemu' *);
	do
		sed -i "$i" \
		-e "s:games/psemu:psemu:g" \
		|| die "sed failed"
	done

	# fix icon and .desktop path
	epatch "${FILESDIR}/${PN}-datadir.patch" \
		"${FILESDIR}/${PN}-implicit-declaration.patch"

	# regenerate for changes to spread
	eautoreconf
}

src_configure() {
	egamesconf \
		$(use_enable alsa) \
		$(use_enable opengl) \
		|| die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install \
	    || die "emake install failed"

	dodoc README doc/keys.txt doc/tweaks.txt ChangeLog
	prepgamesdirs
}
