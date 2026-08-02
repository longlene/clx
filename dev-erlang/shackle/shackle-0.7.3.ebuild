# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="High-Performance Erlang Network Client Framework"
HOMEPAGE="https://github.com/lpgauth/shackle"
SRC_URI="https://github.com/lpgauth/shackle/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-erlang/foil-0.1.4
	>=dev-erlang/knot-0.1.0
	>=dev-erlang/metal-0.1.2
	>=dev-erlang/telemetry-1.4.2
"
RDEPEND="${DEPEND}"
