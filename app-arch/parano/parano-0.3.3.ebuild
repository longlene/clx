# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 autotools

DESCRIPTION="GNOME program to create, edit and verify hashfiles"
HOMEPAGE="http://parano.berlios.de"
SRC_URI="http://download.berlios.de/parano/${P}.tar.gz
	http://download2.berlios.de/parano/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="doc"


DEPEND=">=dev-python/pygtk-2.0
	dev-python/gnome-python"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Many fixes, thanks to dragonheart
	mv src/parano.py src/parano.in
	epatch "${FILESDIR}/${P}-autoconf.patch"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog README NEWS TODO
}
