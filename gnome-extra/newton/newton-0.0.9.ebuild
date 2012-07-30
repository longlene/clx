# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A Gnome Desktop Wiki"
HOMEPAGE="http://newton.sourceforge.net/install.html"
SRC_URI="mirror://sourceforge/newton/${P}.tar.gz"
LICENSE="GPL"


SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-python/gnome-python-2.0.0
	>=dev-python/gnome-python-extras-2.0.0
	>=dev-python/pygtk-2.0.0
	>=gnome-base/libglade-2.0.0
	>=gnome-base/gnome-common-2.0.0
	dev-perl/libxml-perl"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 einstall || die
	dodoc AUTHORS COPYING INSTALL README RELEASE TODO
}
