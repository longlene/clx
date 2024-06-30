# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Elects master node from Erlang/Elixir cluster that is agreed by all nodes"
HOMEPAGE="https://github.com/alfetahe/elector"
SRC_URI="https://github.com/alfetahe/elector/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
