# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Pure-Erlang HTTP and WebSocket server"
HOMEPAGE="https://github.com/arizona-framework/roadrunner"
SRC_URI="https://github.com/arizona-framework/roadrunner/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-erlang/telemetry-1.4.2
	>=dev-erlang/quic-1.6.1
"

src_prepare() {
	sed -e "s/{vsn, semver}/{vsn, \"${PV}\"}/" \
		-i src/roadrunner.app.src || die
	rebar3_src_prepare
}
