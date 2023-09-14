# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Columnar store for analytics with PostgreSQL"
HOMEPAGE="https://github.com/citusdata/cstore_fdw"
SRC_URI="https://github.com/citusdata/cstore_fdw/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
	dev-libs/protobuf-c
"
RDEPEND="${DEPEND}"
