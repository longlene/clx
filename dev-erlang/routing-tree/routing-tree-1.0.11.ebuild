# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="URL routing tree for Erlang/OTP"
HOMEPAGE="https://github.com/novaframework/routing_tree"
SRC_URI="https://github.com/novaframework/routing_tree/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/routing_tree-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REBAR_APP_SRC="src/routing_tree.app.src"

src_install() {
	rebar3_install_lib "_build/${REBAR_PROFILE}/lib/routing_tree"
	einstalldocs
}
