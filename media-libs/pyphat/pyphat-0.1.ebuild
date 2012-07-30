# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

DESCRIPTION="Python bindings for PHAT."
HOMEPAGE="http://phat.berlios.de/"
SRC_URI="http://download.berlios.de/phat/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND=">=x11-libs/gtk+-2.7
	>=dev-python/pygtk-2.4
	>=media-libs/phat-0.4"

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS README
}
