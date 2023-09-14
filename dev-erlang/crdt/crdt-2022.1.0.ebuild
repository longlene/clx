# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Conflict-free Replicated Data Types in Erlang/OTP"
HOMEPAGE="https://github.com/shiguredo/crdt"
SRC_URI="https://github.com/shiguredo/crdt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
