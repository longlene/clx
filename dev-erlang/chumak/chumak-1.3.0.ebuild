# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Pure Erlang implementation of ZeroMQ Message Transport Protocol"
HOMEPAGE="https://github.com/zeromq/chumak"
SRC_URI="https://github.com/zeromq/chumak/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
