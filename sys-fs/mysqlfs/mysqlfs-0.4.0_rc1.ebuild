# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${P/_/-}"

DESCRIPTION="Fuse-filesystem utilising a MySQL database"
SRC_URI="mirror://sourceforge/mysqlfs/${MY_P}.tar.bz2"
HOMEPAGE="http://sourceforge.net/projects/mysqlfs/"

LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
IUSE=""

DEPEND="sys-fs/fuse
	virtual/mysql"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
	dodoc AUTHORS ChangeLog INSTALL NEWS README TODO schema.sql
}

pkg_postinst() {
	elog "The schema for the MySQL database can be found in /usr/share/doc/${PF}/schema.sql"
	elog "Information on mounting mysqlfs using fuse can be found in /usr/share/doc/${PF}/README"
}
