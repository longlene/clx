# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An Erlang library for DTOs validation"
HOMEPAGE="https://github.com/nomasystems/ndto"
SRC_URI="https://github.com/nomasystems/ndto/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/ncalendar
	>=dev-erlang/njson-2.0.0
"
