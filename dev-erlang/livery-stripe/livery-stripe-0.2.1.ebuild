# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/livery_stripe.app.src"

DESCRIPTION="Stripe API client for Erlang/OTP, built on the livery HTTP client"
HOMEPAGE="https://github.com/benoitc/livery_stripe"
SRC_URI="https://github.com/benoitc/livery_stripe/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/livery_stripe-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-erlang/livery"

src_install() {
	local appdir="${S}/_build/default/lib/livery_stripe"
	local destdir
	destdir="$(get_erl_libs)/livery_stripe-${PV}"
	insinto "${destdir}/ebin"
	doins "${appdir}"/ebin/*.{app,beam}
	dodoc README.md
}
