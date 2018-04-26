# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="An open-source time-series database optimized for fast ingest and complex queries"
HOMEPAGE="http://www.timescale.com/"
SRC_URI="https://github.com/timescale/timescaledb/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
