# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang MessagePack MsgPack library"
HOMEPAGE="https://github.com/Ledest/emsgpack"
SRC_URI="https://github.com/Ledest/emsgpack/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
