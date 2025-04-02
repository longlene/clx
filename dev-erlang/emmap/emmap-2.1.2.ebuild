# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang Memory Mapped Files"
HOMEPAGE="https://github.com/saleyn/emmap"
SRC_URI="https://github.com/saleyn/emmap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	rebar3_install_lib .
	rebar3_src_install
}
