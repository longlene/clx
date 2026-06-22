# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Game backend platform built on Nova/OTP"
HOMEPAGE="https://asobi.dev https://github.com/widgrensit/asobi"
SRC_URI="https://github.com/widgrensit/asobi/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# The following deps are not yet in portage/overlay and must be packaged first:
#   dev-erlang/nova        (Hex: nova, GitHub: novaframework/nova)
#   dev-erlang/kura        (Hex: kura >=2.0.4, GitHub: Taure/kura)
#   dev-erlang/kura-postgres (GitHub only: Taure/kura_postgres v0.4.2)
#   dev-erlang/nova-auth   (Hex: nova_auth, GitHub: novaframework/nova_auth)
#   dev-erlang/nova-auth-oidc (Hex: nova_auth_oidc, GitHub: novaframework/nova_auth_oidc)
#   dev-erlang/nova-resilience (Hex: nova_resilience, GitHub: novaframework/nova_resilience)
#   dev-erlang/seki        (Hex: seki >=0.4, GitHub: Taure/seki)
#   dev-erlang/shigoto     (Hex: shigoto >=1.2)
RDEPEND="
	dev-erlang/kura
	dev-erlang/kura-postgres
	dev-erlang/nova
	dev-erlang/nova-auth
	dev-erlang/nova-auth-oidc
	dev-erlang/nova-resilience
	dev-erlang/pgo
	dev-erlang/seki
	dev-erlang/shigoto
	dev-erlang/telemetry
"
