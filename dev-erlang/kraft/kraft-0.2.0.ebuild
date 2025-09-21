# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A minimalistic Erlang web framework"
HOMEPAGE="https://github.com/eproxus/kraft"
SRC_URI="https://github.com/eproxus/kraft/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/cowboy-2.13.0
	>=dev-erlang/cowlib-2.15.0
	>=dev-erlang/bbmustache-1.12.2
	>=dev-erlang/mapz-2.4.0
"
BDEPEND=""
