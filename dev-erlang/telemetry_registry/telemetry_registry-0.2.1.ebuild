# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A library for declaration and discovery of telemetry events"
HOMEPAGE="https://github.com/beam-telemetry/telemetry_registry"
SRC_URI="https://github.com/beam-telemetry/telemetry_registry/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/telemetry-1.0.0
"
BDEPEND=""
