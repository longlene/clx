# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="SQL for Shell Scripts"
HOMEPAGE="http://www.edlsystems.com/shellsql/"
SRC_URI="ftp://ftp.edlsystems.com/shellsql/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="freetds mysql odbc postgres sqlite"

DEPEND="freetds? (dev-db/freetds)
	mysql? (virtual/mysql)
	odbc? (dev-db/libodbc++)
	postgres? (dev-db/postgresql)
	sqlite? (dev-db/sqlite)"
RDEPEND=""

src_compile() {
	cd "${S}/src"
	emake clean || die "Failed to clean sources."
	if use freetds; then
		emake shfreetds || die "Failed to compile freetds module."
		dbstools="shfreetds "
	fi
	if use mysql; then
		emake shmysql || die "Failed to compile mysql module."
		dbstools="${dbstools}shmysql "
	fi
	if use odbc; then
		emake shodbc || die "Failed to compile odbc module."
		dbstools="${dbstools}shodbc "
	fi
	if use postgres; then
		emake shpostgres || die "Failed to compile postgres module."
		dbstools="${dbstools}shpostgres "
	fi
	if use sqlite; then
		emake shsqlite3 || die "Failed to compile sqlite module."
		dbstools="${dbstools} shsqlite3"
	fi
	emake tools || die "Failed to compile toolset."
	dbstools="${dbstools} shsql shsqlend shsqlline shsqlstart shsqlesc shsqlinp"
}

src_install() {
	cd "${S}/src"
	dobin $dbstools
	cd "${S}"
	dodoc CHANGES INSTALL README* TODO COPYING CREDITS
	dohtml -A txt doc/*
}
