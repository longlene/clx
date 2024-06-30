# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Universal and extensible data structure library for interacting with Erlang maps, proplists, dicts"
HOMEPAGE="https://github.com/choptastic/erlang_ds"
SRC_URI="https://github.com/choptastic/erlang_ds/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
