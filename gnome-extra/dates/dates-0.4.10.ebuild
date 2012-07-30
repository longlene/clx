# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="A small, lightweight calendar for Gnome"
HOMEPAGE="http://pimlico-project.org/dates.html"
#SRC_URI="http://pimlico-project.org/sources/dates/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.0
	>=x11-libs/gtk+-2.6
	>=gnome-extra/evolution-data-server-1.8
	>=gnome-base/gconf-2"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0
	>=dev-util/intltool-0.35.0"

DOCS="AUTHORS ChangeLog INSTALL NEWS README"
