# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Authentication library for the Nova ecosystem"
HOMEPAGE="https://github.com/novaframework/nova_auth"
SRC_URI="https://github.com/novaframework/nova_auth/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/nova_auth-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REBAR_APP_SRC="src/nova_auth.app.src"

src_prepare() {
	sed -i '/{project_plugins,/,/^\}\./d' rebar.config || die
	rebar3_src_prepare
}

src_install() {
	rebar3_install_lib "_build/${REBAR_PROFILE}/lib/nova_auth"
	einstalldocs
}

RDEPEND="
	dev-erlang/kura
	dev-erlang/nova
	dev-erlang/seki
"
