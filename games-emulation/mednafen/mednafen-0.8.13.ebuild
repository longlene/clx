# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/mednafen/mednafen-0.8.9.ebuild,v 1.2 2008/07/24 17:37:04 armin76 Exp $
EAPI=2

inherit autotools games

# portage doesn't like it
#MY_PV=$(echo ${PV/ /}|sed -e 's/10/A/' -e 's/11/B/' -e 's/12/C/' -e 's/13/D/' -e 's/14/E/' -e 's/15/F/')

MY_PV="${PV} "
MY_PV="${MY_PV/10/A}"
MY_PV="${MY_PV/11/B}"
MY_PV="${MY_PV/12/C}"
MY_PV="${MY_PV/13/D}"
MY_PV="${MY_PV/14/E}"
MY_PV="${MY_PV/15/F}"
MY_PV="${MY_PV/ }"

DESCRIPTION="An advanced NES, GB/GBC/GBA, TurboGrafx 16/CD, NGPC and Lynx emulator"
HOMEPAGE="http://mednafen.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86"
IUSE="altivec alsa cjk debug jack nls"

RDEPEND="virtual/opengl
	media-libs/libsndfile
	dev-libs/libcdio
	media-libs/libsdl
	media-libs/sdl-net
	alsa? ( media-libs/alsa-lib )
	jack? ( media-sound/jack-audio-connection-kit )
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

S="${WORKDIR}/${PN}"

src_prepare() {
	sed -i \
		-e 's:$(datadir)/locale:/usr/share/locale:' \
		-e 's:$(localedir):/usr/share/locale:' \
		$(find . -name 'Makefile.*') \
		|| die 'sed failed'
	sed -i \
		-e '/-fomit-frame/d' configure.ac \
		|| die "sed failed"
	eautoreconf
}

src_configuration() {
	egamesconf \
		--disable-dependency-tracking \
		$(use_enable altivec) \
		$(use_enable alsa) \
		$(use_enable cjk cjk-fonts) \
		$(use_enable debug debugger) \
		$(use_enable jack) \
		$(use_enable nls) \
		|| die
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc Documentation/cheats.txt AUTHORS ChangeLog TODO
	dohtml Documentation/*
	prepgamesdirs
}
