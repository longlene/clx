# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="GConf Cleaner is to clean up the unknown/invalid gconf keys"
HOMEPAGE="http://code.google.com/p/gconf-cleaner/"
SRC_URI="http://gconf-cleaner.googlecode.com/files/${P}.tar.gz"
KEYWORDS="~x86 ~amd64"
IUSE=""
SLOT="0"

RDEPEND=">=x11-libs/gtk+-2.6
	>=gnome-base/gconf-2.0"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

pkg_setup() {
	DOCS="README"
}
