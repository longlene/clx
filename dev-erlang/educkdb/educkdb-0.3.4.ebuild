# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="DuckDB NIF for Erlang"
HOMEPAGE="https://github.com/mmzeeman/educkdb"
SRC_URI="https://github.com/mmzeeman/educkdb/archive/refs/tags/0.3.4.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
