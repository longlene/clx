# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="Nimuh is a game about Andalucía."
HOMEPAGE="http://www.nimuh.com/"
SRC_URI="http://surfnet.dl.sourceforge.net/sourceforge/nimuh/${P}.tar.gz"

LICENSE="Creative commons"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/sdl-mixer
	media-libs/sdl-image
	dev-libs/expat"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install
}
