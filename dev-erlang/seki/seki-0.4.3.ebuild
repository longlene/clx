# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Resilience library for the BEAM — circuit breaking, rate limiting, and retry"
HOMEPAGE="https://github.com/Taure/seki"
SRC_URI="https://github.com/Taure/seki/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-erlang/telemetry"
