# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="791e9d8c104cb82bb5b353b4e579c05606102f9e"

DESCRIPTION="Redis FDW for PostgreSQL"
HOMEPAGE="https://github.com/pg-redis-fdw/redis_fdw"
SRC_URI="https://github.com/pg-redis-fdw/redis_fdw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
	dev-libs/hiredis
"
RDEPEND="${DEPEND}"
