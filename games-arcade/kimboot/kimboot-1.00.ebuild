# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Doesn't save to user's homedir, so game crashes immediately

inherit games

DESCRIPTION="Sick and addictive, squash the bodies with a ball on a rope"
HOMEPAGE="http://kimboot.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=dev-python/pyode-1.1
	>=dev-python/pygame-1.6
	dev-python/pyopengl
	>=virtual/python-2.3"
DEPEND="app-arch/unzip"

src_unpack() {
	unpack ${A}
	cd "${S}"

	rm *.bat
}

src_install() {
	local dir=${GAMES_DATADIR}/${PN}

	insinto "${dir}"
	doins -r * || die
	rm -f "${D}/${dir}/*.txt"

	games_make_wrapper ${PN} "python kimboot.py" "${dir}"
	doicon ${PN}.png || die
	make_desktop_entry ${PN} "Kimboot" ${PN}.png

	dodoc *.txt

	prepgamesdirs
}
