# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="OpenID Connect authentication for Nova"
HOMEPAGE="https://github.com/novaframework/nova_auth_oidc"
SRC_URI="https://github.com/novaframework/nova_auth_oidc/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/nova_auth_oidc-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REBAR_APP_SRC="src/nova_auth_oidc.app.src"

src_install() {
	rebar3_install_lib "_build/${REBAR_PROFILE}/lib/nova_auth_oidc"
	einstalldocs
}

RDEPEND="
	dev-erlang/nova
	dev-erlang/nova-auth
	>=dev-erlang/oidcc-3.7.0
"
