# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MY_PV=${PV//./_}

DESCRIPTION="PostgreSQL Foreign Data Wrapper for Oracle"
HOMEPAGE="http://laurenz.github.io/oracle_fdw/"
SRC_URI="https://github.com/laurenz/oracle_fdw/archive/ORACLE_FDW_${MY_PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-db/oracle-instantclient
	dev-db/postgresql
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-ORACLE_FDW_${MY_PV}
