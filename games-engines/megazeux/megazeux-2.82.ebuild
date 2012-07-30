# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MY_PV="${PV/./}"
MY_P="mzx${MY_PV}"

DESCRIPTION="The Megazeux Game Creation System"
HOMEPAGE="http://www.digitalmzx.net/"
SRC_URI="http://www.digitalmzx.net/games/${MY_P}src.tar.bz2
	mirror://sourceforge/megazeux/${MY_P}src.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~amd64"
SLOT="0"
RDEPEND="media-libs/libsdl
	media-libs/sdl-image
	X? ( x11-libs/libX11 )
	mikmod? (
		nomodplug? ( media-libs/libmikmod )
	)
	!noaudio? (
		media-libs/libvorbis
		media-libs/libogg
	)
	png? ( media-libs/libpng )"
DEPEND="${RDEPEND}
	opengl? ( virtual/opengl )"
IUSE="X mikmod noaudio noeditor nomodplug opengl png xv"

S="${WORKDIR}/${MY_P}"

src_compile() {
	CONFARGS="--platform linux --prefix /usr/games --sysconfdir /etc/games"
	CONFARGS="$CONFARGS --disable-datestamp --enable-helpsys"
	CONFARGS="$CONFARGS --disable-host-utils --disable-utils"
	CONFARGS="$CONFARGS --enable-software --disable-gp2x --disable-tremor"
	CONFARGS="$CONFARGS --enable-pthread --enable-icon"
	if use noaudio; then
		CONFARGS="$CONFARGS --disable-audio --disable-mikmod
			--disable-modplug"
	else
		CONFARGS="$CONFARGS --enable-audio"
		if (use mikmod && use nomodplug); then
			CONFARGS="$CONFARGS --enable-mikmod 
				--disable-modplug"
		else
			CONFARGS="$CONFARGS --disable-mikmod"
			(use nomodplug && CONFARGS="$CONFARGS 
				--disable-modplug") ||
				CONFARGS="$CONFARGS --enable-modplug"
		fi
	fi
	(use noeditor && CONFARGS="$CONFARGS --disable-editor") ||
		CONFARGS="$CONFARGS --enable-editor"
	./config.sh $CONFARGS \
		$(use_enable X x11) \
		$(use_enable opengl gl) \
		$(use_enable png libpng) \
		$(use_enable xv overlay)
	emake STRIP="true" || die "emake failed"
}

src_install() {
	dodir /usr/games/share/megazeux
	insinto /usr/games/share/megazeux
	doins *.chr smzx.pal mzx_help.fil
	dodir /etc/games
	insinto /etc/games
	newins config.txt megazeux-config
	dogamesbin ${MY_P}
	dosym ${MY_P} /usr/games/bin/megazeux
	dodir /usr/share/icons
	insinto /usr/share/icons
	cd contrib/icons
	newins quantump.png megazeux.png
	prepgamesdirs
}
