# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Scalable PostgreSQL for real-time workloads"
HOMEPAGE="https://www.citusdata.com"
SRC_URI="https://github.com/citusdata/citus/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
