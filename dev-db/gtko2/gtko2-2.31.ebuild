# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit base

DESCRIPTION="GTKO is a GTK+ 2 Oracle development tool"
HOMEPAGE="http://gtko.net/"
SRC_URI="mirror://sourceforge/gsqlr2/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.6.0
        >=dev-db/oracle-instantclient-basic-10.1.0.5
		<=x11-libs/gtksourceview-2.0"
