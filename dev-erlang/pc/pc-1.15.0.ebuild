# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

SRC_URI="https://github.com/blt/port_compiler/archive/refs/tags/v${PV}.tar.gz -> port_compiler-${PV}.tar.gz"

SLOT="0"
S="${WORKDIR}"/port_compiler-${PV}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
