# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-board/ggz-gtk-games/ggz-gtk-games-0.0.7.ebuild,v 1.5 2004/06/24 22:16:51 agriffis Exp $

DESCRIPTION="These are the gtk versions of the games made by GGZ Gaming Zone"
HOMEPAGE="http://ggz.sourceforge.net/"
SRC_URI="http://ftp.ggzgamingzone.org/pub/ggz/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc"
IUSE=""

DEPEND="=dev-games/libggz-0.0.9
	=dev-games/ggz-client-libs-0.0.9"

src_compile() {
	myconf=""

	econf \
		--disable-dependency-tracking \
		${myconf} || die
	emake || die
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc AUTHORS ChangeLog INSTALL NEWS QuickStart.GGZ README* TODO
}
