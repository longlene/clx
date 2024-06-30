# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar3

DESCRIPTION="Erlang Fast JSON parser"
HOMEPAGE="https://github.com/saleyn/simdjsone"
SRC_URI="https://github.com/saleyn/simdjsone/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
