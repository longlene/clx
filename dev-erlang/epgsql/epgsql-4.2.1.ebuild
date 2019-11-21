# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Erlang PostgreSQL client library"
HOMEPAGE="https://github.com/epgsql/epgsql"
SRC_URI="https://github.com/epgsql/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~x86"

LICENSE="epgsql"
SLOT="0"
IUSE="src"

RDEPEND=""
DEPEND="${DEPEND}"

