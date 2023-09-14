# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

IUSE=""

DESCRIPTION="Database independant embedded SQL-92 precompiler for C++ and Java"
HOMEPAGE="http://www.uesqlc.org/"
SRC_URI="http://www.uesqlc.org/download/uesqlc/${P}.zip"

SLOT="0"
LICENSE="GPL"
KEYWORDS="~x86"

DEPEND=">=dev-libs/mpcl-11.0.0
	>=dev-java/jdbc3-postgresql-7.4.5"

src_compile() {
	econf --with-postgresql-jdbc=/usr/share/jdbc3-postgresql/lib/jdbc3-postgresql.jar
	emake || die
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc AUTHORS BUGS ChangeLog COPYING* NEWS README* THANKS TODO VERSION
}
