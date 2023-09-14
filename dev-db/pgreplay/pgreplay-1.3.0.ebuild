# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="extracts the SQL statements and executes them in the same order and relative time against a PostgreSQL database cluster"
HOMEPAGE="https://github.com/laurenz/pgreplay"
SRC_URI="https://github.com/laurenz/pgreplay/archive/PGREPLAY_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
