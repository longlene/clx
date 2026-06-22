# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang library to create and connect an arbitrary cluster of nodes"
HOMEPAGE="https://github.com/stritzinger/braid"
SRC_URI="https://github.com/stritzinger/braid/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/argparse
	dev-erlang/certifi
	dev-erlang/color
	dev-erlang/jsx
	dev-erlang/mapz
"
