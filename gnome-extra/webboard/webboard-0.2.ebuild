# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 distutils

DESCRIPTION="Copy and paste to a public pastebin server"
HOMEPAGE="http://gnomefiles.org/app.php/WebBoard"
SRC_URI="http://pimpzkru.de/sebi/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-util/intltool-0.34"
RDEPEND=">=dev-python/pygtk-2.6
	dev-python/gnome-python-desktop"
