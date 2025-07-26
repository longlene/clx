# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="An Erlang process spawner API that solves a design fundamental issue"
HOMEPAGE="https://github.com/erlangsters/spawn-mode"
SRC_URI="https://github.com/erlangsters/spawn-mode/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
"
BDEPEND=""
