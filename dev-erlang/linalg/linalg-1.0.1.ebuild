# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

DESCRIPTION="A Matrix Library for Erlang in Erlang"
HOMEPAGE="https://github.com/sklassen/erlang-linalg-native"
SRC_URI="https://github.com/sklassen/erlang-linalg-native/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
