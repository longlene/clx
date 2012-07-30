# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MY_PN="${PN/-bin/}"
MY_P="${P/-bin/}"
DESCRIPTION="Sticky 2D shooter TUMIKI Fighters"
HOMEPAGE="http://www.asahi-net.or.jp/~cs8k-cyu/windows/tf_e.html http://tumiki.sourceforge.net/"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="virtual/opengl
	virtual/glu
	media-libs/libsdl
	media-libs/sdl-mixer"

S="${WORKDIR}/tf"

pkg_setup() {
	if ! built_with_use media-libs/sdl-mixer vorbis ; then
		eerror "TUMIKI Fighters will crash if sdl-mixer is"
		eerror "built without vorbis support"
		die "Please emerge sdl-mixer with USE=vorbis"
	fi
	games_pkg_setup
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	dogamesbin "${FILESDIR}/tumiki" || die "dogamesbin failed"
	local dir="${GAMES_PREFIX_OPT}/${PN}"
	exeinto "${dir}"
	doexe tf || die "doexe failed"
	insinto "${dir}"
	doins -r barrage enemy field sounds stage tumiki || die "doins failed"
	dodoc readme* || die "dodoc failed"
	doicon "${FILESDIR}/${PN}.png"
	make_desktop_entry tumiki "TUMIKI Fighters"
	prepgamesdirs
}

