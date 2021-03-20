# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Dynamic dispatching library for metrics and instrumentations"
HOMEPAGE="https://github.com/beam-telemetry/telemetry"
SRC_URI="https://github.com/beam-telemetry/telemetry/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
