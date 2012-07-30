# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="Pushover is a fun puzzle game originally published by Ocean in 1992."
HOMEPAGE="http://pushover.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/lua
	media-libs/sdl-mixer
	media-libs/sdl-ttf"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "einstall failed"
}
