# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="PostgreSQL-backed background job processing for the Nova ecosystem"
HOMEPAGE="https://github.com/Taure/shigoto"
SRC_URI="https://github.com/Taure/shigoto/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-erlang/pgo-0.20.0
	dev-erlang/seki
	dev-erlang/telemetry
"
