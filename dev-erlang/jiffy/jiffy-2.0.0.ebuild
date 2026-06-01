# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="JSON NIFs for Erlang"
HOMEPAGE="https://github.com/davisp/jiffy"
SRC_URI="https://github.com/davisp/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT Apache-2.0 Boost-1.0"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( README.md )

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
}
