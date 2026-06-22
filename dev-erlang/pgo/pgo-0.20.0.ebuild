# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Postgres client and connection pool"
HOMEPAGE="https://github.com/erleans/pgo"
SRC_URI="https://github.com/erleans/pgo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-erlang/opentelemetry-api"
RDEPEND="${DEPEND}
	dev-erlang/backoff
	dev-erlang/pg-types
"

src_prepare() {
	eapply "${FILESDIR}"/${P}-no-project-plugins.patch
	rebar3_src_prepare
}
