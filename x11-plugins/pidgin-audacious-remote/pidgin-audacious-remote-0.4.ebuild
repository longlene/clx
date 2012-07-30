# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Pidgin plugin to allow interaction with Audacious player"
HOMEPAGE="http://pidginaudacious.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/-audacious-remote/audacious}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-im/pidgin[gtk]
	>=media-sound/audacious-1.5"
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog INSTALL || die
}
