# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="8d64872ccffa58f1d1b0858246e233dd6d7fe0c5"

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
