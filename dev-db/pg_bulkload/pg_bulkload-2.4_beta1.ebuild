# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="pg_bulkload is a high speed data loading utility for PostgreSQL"
HOMEPAGE="http://pgbulkload.projects.postgresql.org/"

V_PG="8.3.5"

SRC_URI="http://pgfoundry.org/frs/download.php/2005/${PN}-${PV/_/}.tar.gz
  mirror://postgresql/source/v${V_PG}/postgresql-${V_PG}.tar.bz2"

inherit eutils multilib toolchain-funcs versionator autotools

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND=">=virtual/postgresql-base-8.2"
DEPEND="$COMMON_DEPEND
	dev-util/pkgconfig"
RDEPEND="$COMMON_DEPEND"

MY_WORKDIR="${WORKDIR}/postgresql-${V_PG}/contrib/${PN}"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${PN}" "${MY_WORKDIR}"
}

src_compile() {
	cd "${WORKDIR}/postgresql-${V_PG}"
	econf || die "failed to configure"
	cd "${MY_WORKDIR}"
	emake -j1 || die "failed to build pg_bulkload"
}

src_install() {
	cd "${MY_WORKDIR}"
	make DESTDIR="${D}" install || die "Installation failed"
}

