# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="sqlite3 NIF bindings for Erlang"
HOMEPAGE="https://github.com/max-au/sqlite"
SRC_URI="https://github.com/max-au/sqlite/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
