# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Simple HTTP client with HTTP/1.1, HTTP/2, and HTTP/3 support"
HOMEPAGE="https://github.com/benoitc/hackney"
SRC_URI="https://github.com/benoitc/hackney/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="${RDEPEND}
	>=dev-erlang/certifi-2.17.0
	>=dev-erlang/h2-0.12.0
	>=dev-erlang/idna-7.1.0
	>=dev-erlang/mimerl-1.5
	>=dev-erlang/quic-1.8.0
	>=dev-erlang/ssl_verify_fun-1.1.0
	>=dev-erlang/webtransport-0.4.5
"
BDEPEND="${BDEPEND}
	dev-erlang/parse_trans
"

src_prepare() {
	rebar3_src_prepare
	eapply "${FILESDIR}/hackney-4.7.4-no-ct-expand.patch"
	# project_plugins are dev tools not needed at build time and unfetchable
	# with HEX_OFFLINE=true.
	sed -i '/^{project_plugins, \[rebar3_ex_doc\]}\.$/d' rebar.config || die
}

src_install() {
	rebar3_src_install
	# include/ in _build/ is a symlink — install headers manually
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}
