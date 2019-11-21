# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="DataBase Interface for Erlang/Elixir to use MySQL"
HOMEPAGE="https://github.com/dbi-beam/dbi_mysql"
SRC_URI="https://github.com/dbi-beam/dbi_mysql/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/dbi-1.0.0
	>=dev-erlang/poolboy-1.5.1
	>=dev-erlang/p1_mysql-1.0.4
"
RDEPEND="${DEPEND}"
BDEPEND=""
