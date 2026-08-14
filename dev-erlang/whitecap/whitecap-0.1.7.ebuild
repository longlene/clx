# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="High-Performance Erlang HTTP 1.1 Server"
HOMEPAGE="https://github.com/lpgauth/whitecap"
SRC_URI="https://github.com/lpgauth/whitecap/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${RDEPEND}
	dev-erlang/foil
	dev-erlang/telemetry"

src_install() {
	rebar3_src_install
	# include/ is a symlink in _build/ — the eclass skips symlinks
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}
