# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/livery_revolut.app.src"

DESCRIPTION="Revolut Merchant API client for Erlang/OTP, built on the livery HTTP client"
HOMEPAGE="https://github.com/benoitc/livery_revolut"
SRC_URI="https://github.com/benoitc/livery_revolut/archive/bbc5b00d5916308a2b544318f008f321471a9b26.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/livery_revolut-bbc5b00d5916308a2b544318f008f321471a9b26"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-erlang/livery"

src_install() {
	local appdir="${S}/_build/default/lib/livery_revolut"
	local destdir
	destdir="$(get_erl_libs)/livery_revolut-${PV}"
	insinto "${destdir}/ebin"
	doins "${appdir}"/ebin/*.{app,beam}
	dodoc README.md
}
