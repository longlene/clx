# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="High-Performance Erlang Network Client Framework"
HOMEPAGE="https://github.com/lpgauth/shackle"
SRC_URI="https://github.com/lpgauth/shackle/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/fail-0.1.3
	>=dev-erlang/granderl-0.1.5
	>=dev-erlang/metal-0.1.1
	>=dev-erlang/telemetry-1.2.1
"
RDEPEND="${DEPEND}"
BDEPEND=""
