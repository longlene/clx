# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Tile World is an emulation of the game \"Chip's Challenge\""
HOMEPAGE="http://www.muppetlabs.com/~breadbox/software/tworld/"
SRC_URI="http://www.muppetlabs.com/~breadbox/pub/software/tworld/${P}.tar.gz
		 cclp2? ( http://www.muppetlabs.com/~breadbox/pub/software/tworld/${P}-CCLP2.tar.gz )"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="cclp2"

DEPEND="media-libs/libsdl"

src_install() {
	dogamesbin tworld
	insinto ${GAMES_DATADIR}/${PN}/sets
	doins sets/*
	insinto ${GAMES_DATADIR}/${PN}/data
	doins data/*
	insinto ${GAMES_DATADIR}/${PN}/res
	doins res/*
	dodoc BUGS Changelog README
	doman docs/tworld.6
	dohtml docs/tworld.html
	prepgamesdirs
}
