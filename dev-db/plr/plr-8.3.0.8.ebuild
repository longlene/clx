# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Author: Philip R. Kensche

inherit eutils

DESCRIPTION="PL/R addon for postgresql database"
HOMEPAGE="http://www.joeconway.com/plr/"
SRC_URI="http://www.joeconway.com/plr/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="8.4"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="=virtual/postgresql-server-${SLOT}
        dev-lang/R"

# To check? -> R --enable-R-shlibs

S="${WORKDIR}/contrib/${PN}"

src_unpack() {
        unpack ${A}
        mkdir "${WORKDIR}/contrib"
        mv "${WORKDIR}/plr" "${S}"
}

src_compile() {
	if has_version "dev-db/postgresql-server:${SLOT}" ; then
		export PG_CONFIG="/usr/$(get_libdir)/postgresql-${SLOT}/bin/pg_config"
	fi
	USE_PGXS=1 emake -j1 || die "emake failed"
}

src_install() {
        USE_PGXS=1 emake -j1 DESTDIR="${D}" install || die "emake install failed"
        einfo ""
        einfo "To install PL/R to your database issue"
        einfo ""
	if has_version "dev-db/postgresql-server:${SLOT}" ; then
		sharepath="/usr/share/postgresql-${SLOT}/contrib"
	else
		sharepath="/usr/share/postgresql/contrib"
	fi
        einfo "       psql -d mydatabase -U pg_username < ${sharepath}/plr.sql"
        einfo ""
	einfo "You may have to login as database administrator."
	einfo ""
        einfo "You have to define PL/R as TRUSTED language to allow non-administrators"
	einfo "to use it. Change the CREATE LANGUAGE statement in the plr.sql file"
	einfo "into"
	einfo ""
	einfo "       CREATE TRUSTED LANGUAGE plr HANDLER plr_call_handler;"
	einfo ""
	einfo "update the database as shown above and allow a specific user to"
	einfo "use PL/R by"
        einfo ""
        einfo "       GRANT USAGE ON LANGUAGE plr TO pg_username;"
        einfo ""
        einfo "For further information on PL/R have a look at"
        einfo ""
        einfo "       http://www.joeconway.com/plr/"
        einfo ""
}


