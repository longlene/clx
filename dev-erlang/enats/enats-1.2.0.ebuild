# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang NATS.io client library"
HOMEPAGE="https://github.com/travelping/enats"
SRC_URI="https://github.com/travelping/enats/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/opentelemetry-api
	dev-erlang/enats-msg
"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}"/${P}-otp27-deprecated-catch.patch
	rebar3_src_prepare
}
