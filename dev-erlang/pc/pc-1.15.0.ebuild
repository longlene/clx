# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/blt/port_compiler/archive/refs/tags/v${PV}.tar.gz -> port_compiler-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/port_compiler-${PV}
