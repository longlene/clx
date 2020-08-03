# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="DataBase Interface for Erlang/Elixir to use SQLite"
HOMEPAGE="https://github.com/dbi-beam/dbi_sqlite"
SRC_URI="https://github.com/dbi-beam/dbi_sqlite/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/dbi-1.0.0
	>=dev-erlang/esqlite-0.2.3
"
RDEPEND="${DEPEND}"
BDEPEND=""
