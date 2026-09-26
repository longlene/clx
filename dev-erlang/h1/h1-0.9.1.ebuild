# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="HTTP/1.1 protocol library for Erlang"
HOMEPAGE="https://github.com/benoitc/erlang_h1"
SRC_URI="https://github.com/benoitc/erlang_h1/archive/refs/tags/${PV}.tar.gz
	-> erlang_${P}.tar.gz"
S="${WORKDIR}/erlang_h1-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

src_prepare() {
	rebar3_src_prepare
	sed -i -e 's/,\s*warnings_as_errors//' -e 's/warnings_as_errors,\s*//' rebar.config || die
	# project_plugins (rebar3_ex_doc, rebar3_hex, rebar3_proper) are dev tools
	# not needed at build time and unfetchable with HEX_OFFLINE=true.
	sed -i '/^{project_plugins,/,/^\]}.\s*$/d' rebar.config || die
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}
