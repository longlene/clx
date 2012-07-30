# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Monitor disk usage from GNOME panel"
HOMEPAGE="http://disk-status.sourceforge.net"
SRC_URI="mirror://sourceforge/disk-status/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
S=${WORKDIR}/${PN}

DEPEND=""
RDEPEND=">=dev-python/pygtk-2.6
	dev-python/gnome-python-desktop"
