# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Small application written to allow one to play the eponymous puzzle game"
HOMEPAGE="http://tecnocode.co.uk/projects/hitori/"
SRC_URI="http://tecnocode.co.uk/downloads/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-libs/glib-2
	>=x11-libs/cairo-1.4.0
	>=x11-libs/gtk+-2.14"

DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.20"

DOCS="AUTHORS ChangeLog NEWS README"
