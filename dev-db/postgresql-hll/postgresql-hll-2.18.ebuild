# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="PostgreSQL extension adding HyperLogLog data structures as a native data type"
HOMEPAGE="https://github.com/citusdata/postgresql-hll"
SRC_URI="https://github.com/citusdata/postgresql-hll/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
BDEPEND=""
