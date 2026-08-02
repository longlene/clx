# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang library for consensus democracy, including Condorcet voting"
HOMEPAGE="https://github.com/kbaird/consensus"
SRC_URI="https://github.com/kbaird/consensus/archive/3ca6ef0799e55b71db44513f6c939088947e7272.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/consensus-3ca6ef0799e55b71db44513f6c939088947e7272"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	rebar3_src_install
	insinto "$(get_erl_libs)/${P}/include"
	doins "${S}"/include/*.hrl
}
