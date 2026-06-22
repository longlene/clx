# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/gen_batch_server.app.src"

inherit rebar3

DESCRIPTION="A generic batching server for Erlang and Elixir"
HOMEPAGE="https://github.com/rabbitmq/gen-batch-server"
SRC_URI="https://github.com/rabbitmq/gen-batch-server/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="|| ( Apache-2.0 MPL-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	# Package uses underscores internally (gen_batch_server) but is named
	# with hyphens; rebar3_install_lib must point at the actual build path
	rebar3_install_lib "_build/default/lib/gen_batch_server"
	einstalldocs
}
