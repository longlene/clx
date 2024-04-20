# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Telemetry instrumentation for Cowboy"
HOMEPAGE="https://github.com/beam-telemetry/cowboy_telemetry"
SRC_URI="https://github.com/beam-telemetry/cowboy_telemetry/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/cowoby
	dev-erlang/telemetry
"
RDEPEND="${DEPEND}"
BDEPEND=""
