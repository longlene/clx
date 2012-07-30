# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="A GNOME GUI for configuring a users crontab"
HOMEPAGE="http://gnome-schedule.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/python
	>=dev-libs/glib-2
	>=dev-python/gnome-python-2
	sys-process/at
	dev-util/pkgconfig"

RDEPEND="virtual/python
        >=dev-libs/glib-2
        >=dev-python/gnome-python-2
        sys-process/at
	virtual/cron"


DOCS="AUTHORS ChangeLog NEWS README TODO"

