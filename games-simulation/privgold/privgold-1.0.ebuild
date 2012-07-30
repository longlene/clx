# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Wing Commander Privateer Gemini Gold"
HOMEPAGE="http://priv.solsector.net/"
SRC_URI="mirror://sourceforge/wcuniverse/${PN}10.bz2.run"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="virtual/opengl
	virtual/x11"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack_makeself
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	dodoc ${WORKDIR}/Manual.pdf	${WORKDIR}/COPYING ${WORKDIR}/Version.txt
	cp ${FILESDIR}/privscript ${T}
	sed "s%GAMESDIR=\"[^\"]*\"%GAMESDIR=\"${GAMES_DATADIR}\"%" -i ${T}/privscript
	newgamesbin ${T}/privscript ${PN} || die "couldn't install launcher"
	dodir "${GAMES_DATADIR}"
	mv "${WORKDIR}" "${D}${GAMES_DATADIR}/${PN}" || die "data copy failed"
	prepgamesdirs
}
