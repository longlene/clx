# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Table Log for PostgreSQL allows to track changes on a specific table"
HOMEPAGE="http://gborg.postgresql.org/project/tablelog/projdisplay.php"
SRC_URI="ftp://gborg.postgresql.org/pub/tablelog/stable/${P}.tar.gz
	http://gborg.postgresql.org/download/tablelog/stable/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-db/postgresql-7.3"

pkg_setup() {
	# the pg_config tool must be in $PATH for installation.
	if ! which pg_config > /dev/null 2>&1; then
		eerror "Unable to find pg_config in the PATH."
		eerror "You need pg_config to be able to build table_log"
		die "Unable to find pg_config in the PATH"
	fi
}

src_compile() {
	# Unfortunately, there is no configure script
	# and the supplied Makefile.nocontrib won't work
	# properly so that we have to do it the hard way.
	PG_INCLUDEDIR_SERVER="`pg_config --includedir-server`"
	PG_INCLUDEDIR="`pg_config --includedir`"
	PG_LIBDIR="`pg_config --libdir`"

	gcc ${CFLAGS} -Wall -I${PG_INCLUDEDIR_SERVER} -I${PG_INCLUDEDIR} -fpic -c table_log.c
	gcc ${CFLAGS} -Wall -L${PG_LIBDIR} -shared table_log.o -o table_log.so
	sed 's,MODULE_PATHNAME,$libdir/table_log,g' table_log.sql.in > table_log.sql
}

src_install() {
	PG_PKGLIBDIR="`pg_config --pkglibdir`"
	insinto ${PG_PKGLIBDIR}
	insopts -m0755
	doins table_log.so

	dodoc README.table_log table_log_init.sql table_log.sql
}

pkg_postinst() {
	DOCDIR="/usr/share/doc"

	einfo "For every database you want to use table_log you need to create these functions:"
	einfo ""
	einfo "CREATE FUNCTION \"table_log\" ()"
	einfo "    RETURNS trigger"
	einfo "    AS '\$libdir/table_log', 'table_log' LANGUAGE 'C';"
	einfo "CREATE FUNCTION \"table_log_restore_table\" (VARCHAR, VARCHAR, CHAR, CHAR, CHAR, TIMESTAMPTZ, CHAR, INT, INT)"
	einfo "    RETURNS VARCHAR"
	einfo "    AS '\$libdir/table_log', 'table_log_restore_table' LANGUAGE 'C';"
	einfo "CREATE FUNCTION \"table_log_restore_table\" (VARCHAR, VARCHAR, CHAR, CHAR, CHAR, TIMESTAMPTZ, CHAR, INT)"
	einfo "    RETURNS VARCHAR"
	einfo "    AS '\$libdir/table_log', 'table_log_restore_table' LANGUAGE 'C';"
	einfo "CREATE FUNCTION \"table_log_restore_table\" (VARCHAR, VARCHAR, CHAR, CHAR, CHAR, TIMESTAMPTZ, CHAR)"
	einfo "    RETURNS VARCHAR"
	einfo "    AS '\$libdir/table_log', 'table_log_restore_table' LANGUAGE 'C';"
	einfo "CREATE FUNCTION \"table_log_restore_table\" (VARCHAR, VARCHAR, CHAR, CHAR, CHAR, TIMESTAMPTZ)"
	einfo "    RETURNS VARCHAR"
	einfo "    AS '\$libdir/table_log', 'table_log_restore_table' LANGUAGE 'C';"
	einfo ""
	einfo "Install table_log_init() by running 'psql < gunzip -c ${DOCDIR}/${P}/table_log_init.sql.gz'"
	einfo ""
	einfo "For any further information look at README.table_log located in ${DOCDIR}/${P}"
}
