# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Cassandra driver for Erlang"
HOMEPAGE="https://github.com/exosite/ecql"
SRC_URI="https://github.com/exosite/ecql/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
