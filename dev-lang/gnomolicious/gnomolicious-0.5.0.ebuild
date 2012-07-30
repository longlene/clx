# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 distutils

DESCRIPTION="GNOME way to post at del.icio.us"
HOMEPAGE="http://www.nongnu.org/gnomolicious/"
SRC_URI="http://savannah.nongnu.org/download/gnomolicious/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE=""
DEPEND="dev-python/pygtk"
src_install() {
	distutils_src_install --prefix=/usr --disable-schemas-install
	#dodir /etc/gconf/schemas
	#cp ${S}/data/gnomolicious.schemas ${D}/etc/gconf/schemas/
}
pkg_postinst() {
	distutils_pkg_postinst
	gnome2_pkg_postinst
}
