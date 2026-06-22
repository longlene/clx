# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/kura_postgres.app.src"

DESCRIPTION="PostgreSQL backend for kura"
HOMEPAGE="https://github.com/Taure/kura_postgres"
SRC_URI="https://github.com/Taure/kura_postgres/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/kura_postgres-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-erlang/kura"
RDEPEND="${DEPEND}
	dev-erlang/pgo
"

src_prepare() {
	eapply "${FILESDIR}"/${P}-no-project-plugins.patch
	rebar3_src_prepare
}
