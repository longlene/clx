# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="WebTransport protocol for Erlang (HTTP/2 and HTTP/3)"
HOMEPAGE="https://github.com/benoitc/erlang-webtransport"
SRC_URI="https://github.com/benoitc/erlang-webtransport/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/erlang-webtransport-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-erlang/h2-0.12.0
	>=dev-erlang/quic-2.0.0
"

src_prepare() {
	rebar3_src_prepare
	sed -i -e 's/,\s*warnings_as_errors//' -e 's/warnings_as_errors,\s*//' rebar.config || die
	# project_plugins are dev tools not needed at build time and unfetchable
	# with HEX_OFFLINE=true.
	sed -i '/^{project_plugins,.*$/d' rebar.config || die
}
