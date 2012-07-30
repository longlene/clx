# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="GNOME 2 panel applet for grouping windows to minimize and restore together"
HOMEPAGE="http://windowgrouper.sourceforge.net/"
SRC_URI="mirror://sourceforge/windowgrouper/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.6
		>=gnome-base/gnome-panel-2.10.0
		>=gnome-base/libgnome-2.10.0
		>=gnome-base/libgnomeui-2.10.0"
DEPEND="${RDEPEND}
	app-text/gnome-doc-utils"

DOCS="AUTHORS ChangeLog NEWS README"
