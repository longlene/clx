# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Writable Foreign Data Wrapper for Redis"
HOMEPAGE="https://github.com/nahanni/rw_redis_fdw"
SRC_URI="https://github.com/nahanni/rw_redis_fdw/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
	dev-libs/hiredis
"
RDEPEND="${DEPEND}"
