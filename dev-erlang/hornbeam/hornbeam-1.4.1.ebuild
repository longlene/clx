# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="WSGI/ASGI HTTP server powered by the BEAM"
HOMEPAGE="https://hornbeam.dev"
SRC_URI="https://github.com/benoitc/hornbeam/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-erlang/cowboy-2.12.0
	>=dev-erlang/erlang_python-1.8.1
"

src_compile() {
	rebar3 compile || die
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.py
}
