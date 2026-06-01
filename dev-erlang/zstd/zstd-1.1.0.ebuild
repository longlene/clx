# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Zstd binding for Erlang/Elixir"
HOMEPAGE="https://github.com/AdRoll/zstd-erlang"
SRC_URI="https://github.com/AdRoll/zstd-erlang/archive/refs/tags/v${PV}.tar.gz -> ${PN}-erlang-${PV}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
S="${WORKDIR}"/zstd-erlang-${PV}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
