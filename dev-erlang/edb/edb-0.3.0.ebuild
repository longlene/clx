# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="The next-generation debugger for Erlang"
HOMEPAGE="https://github.com/WhatsApp/edb"
SRC_URI="https://github.com/WhatsApp/edb/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	erebar3 escriptize
}

src_install() {
	dobin _build/default/bin/edb
	einstalldocs
}
