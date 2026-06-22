# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Production-grade resilience patterns for the Nova web framework"
HOMEPAGE="https://github.com/novaframework/nova_resilience"
SRC_URI="https://github.com/novaframework/nova_resilience/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/nova_resilience-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REBAR_APP_SRC="src/nova_resilience.app.src"

src_install() {
	rebar3_install_lib "_build/${REBAR_PROFILE}/lib/nova_resilience"
	einstalldocs
}

RDEPEND="
	dev-erlang/nova
	dev-erlang/seki
"
