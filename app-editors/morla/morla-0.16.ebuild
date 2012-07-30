# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Morla is a multiplatform editor of RDF documents."
HOMEPAGE="http://www.morlardf.net/index.php"
SRC_URI="http://www.morlardf.net/src/${P}.tar.gz"

LICENSE="GPL v2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-libs/libnxml
	dev-libs/redland
	dev-libs/libxslt
	media-gfx/graphviz
	x11-libs/gtk+
	dev-libs/glib
	gnome-extra/gtkhtml
	net-misc/curl
	gnome-base/gconf"

pkg_postinst() { 
	elog "You can now start morla mit 'morla'."
}
