# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="DBI PostgreSQL extension using PGO"
HOMEPAGE="https://github.com/dbi-beam/dbi_pgo"
SRC_URI="https://github.com/dbi-beam/dbi_pgo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/dbi-1.1.5
	>=dev-erlang/pgo-0.2.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
