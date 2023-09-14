# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

DESCRIPTION="LZ4 bindings for Erlang"
HOMEPAGE="https://github.com/martinsumner/erlang-lz4"
SRC_URI="https://github.com/martinsumner/erlang-lz4/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
