# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde

DESCRIPTION="KDE database frontend for administration of mysql servers"
HOMEPAGE="http://www.alwins-world.de/programs/kmysqladmin/"
SRC_URI="http://www.alwins-world.de/programs/download/kmysqladmin/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-db/mysql-5"
need-kde 3

src_compile() {
	local myconf="--with-mysql-lib=/usr/lib/mysql-500
		--with-mysql-include=/usr/include/mysql-500"
	kde_src_compile
}
