# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Pure Erlang PostgreSQL driver"
HOMEPAGE="https://github.com/processone/p1_pgsql"
SRC_URI="https://github.com/processone/${PN}/archive/${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="ErlPL-1.1"
SLOT="0"
KEYWORDS="amd64 ~arm ~ia64 ppc ~sparc x86"

DEPEND=">=dev-lang/erlang-17.1"
RDEPEND="${DEPEND}"

DOCS=( CHANGELOG.md  README.md )
