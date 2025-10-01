# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang PostgreSQL client library"
HOMEPAGE="https://github.com/epgsql/epgsql"
SRC_URI="https://github.com/epgsql/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

KEYWORDS="~amd64 ~x86"

LICENSE="epgsql"
SLOT="0"
IUSE="src"

RDEPEND=""
DEPEND="${DEPEND}"

