# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

G_P="nuoveXT-${PV}"

S="${WORKDIR}"

DESCRIPTION="nuoveXT is an icon theme for GNOME."
HOMEPAGE="http://nuovext.pwsp.net/"
SRC_URI="http://nuovext.pwsp.net/files/${G_P}.tar.gz" 

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86"

src_compile() {
	:
}

src_install() {
	dodir /usr/share/icons/nuoveXT
	cd ${G_P}
	cp -r * "${D}/usr/share/icons/nuoveXT/"
}
