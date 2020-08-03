# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="DataBase Interface for Erlang/Elixir to use PostgreSQL"
HOMEPAGE="https://github.com/dbi-beam/dbi_pgsql"
SRC_URI="https://github.com/dbi-beam/dbi_pgsql/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/dbi-1.1.5
	>=dev-erlang/poolboy-1.5.1
	>=dev-erlang/epgsql-3.4.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
