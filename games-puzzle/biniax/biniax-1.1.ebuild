# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="Biniax is an unique arcade logic game. Simple and addictive, you \
can learn in a minute and play for hours."
HOMEPAGE="http://biniax.com"
SRC_URI="http://mordred.dir.bg/${PN}/${PN}-linux86.tar.gz"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
S="${WORKDIR}/${PN}-linux86"
DEPEND="media-libs/libsdl
		media-libs/sdl-mixer"

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${PN}"
	cd ${S}
	
	insinto ${dir}
	doins -r data biniax
	fperms 0755 ${dir}/biniax

	dodoc Readme.txt
	newicon icon.ico biniax.ico
	
	make_desktop_entry ${PN} ${PN} icon.ico "" ${dir}
	games_make_wrapper biniax "./biniax" "${dir}"
	prepgamesdirs
}
