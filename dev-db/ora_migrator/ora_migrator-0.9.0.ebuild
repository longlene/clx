# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="Tools for Oracle to PostgreSQL migration"
HOMEPAGE="https://github.com/cybertec-postgresql/ora_migrator"
SRC_URI="https://github.com/cybertec-postgresql/ora_migrator/archive/ORA_MIGRATOR_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}
	dev-db/oracle_fdw
"

src_compile() {
	USE_PGXS=1 emake
}

src_install() {
	USE_PGXS=1 DESTDIR="${D}" emake install
}
