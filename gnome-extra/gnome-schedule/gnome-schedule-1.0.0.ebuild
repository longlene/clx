# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2

DESCRIPTION="Gnome-schedule is a GUI to aid users configuring the crontab and at daemons."
HOMEPAGE="http://gnome-schedule.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.6
	>=gnome-base/gconf-2
	>=dev-libs/glib-2.6
	>=dev-lang/python-2.3
	>=dev-python/pygtk-2.6
	virtual/cron"

DEPEND="${RDEPEND}
	sys-devel/gettext
	sys-process/at
	>=dev-util/pkgconfig-0.9
	>=dev-util/intltool-0.28"

DOCS="AUTHORS NEWS README TODO"
