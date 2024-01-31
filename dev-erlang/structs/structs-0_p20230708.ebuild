# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="ab5b0e446060726899cda49ee52456583c86f177"

DESCRIPTION="An Elixir struct handler for Erlang"
HOMEPAGE="https://github.com/rvirding/structs"
SRC_URI="https://github.com/rvirding/structs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
