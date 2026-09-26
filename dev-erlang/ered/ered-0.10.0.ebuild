# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An Erlang client for Valkey/Redis"
HOMEPAGE="https://github.com/Ericsson/ered"
SRC_URI="https://github.com/Ericsson/ered/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

RDEPEND="
	>=dev-lang/erlang-27.3.4
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DOCS=( README.md )
