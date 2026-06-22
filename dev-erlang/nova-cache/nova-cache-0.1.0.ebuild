# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/nova_cache.app.src"

inherit rebar3

DESCRIPTION="General-purpose KV cache library for the Nova ecosystem"
HOMEPAGE="https://github.com/novaframework/nova_cache"
SRC_URI="https://github.com/novaframework/nova_cache/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/nova_cache-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	# Remove dev-only plugins that require network access at build time
	sed -i '/^{project_plugins,/,/^\]}\./d' rebar.config || die
	rebar3_src_prepare
}

src_install() {
	# Build dir uses underscore; eclass expects ${PN} (hyphen) — install directly
	pushd "_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/nova_cache
	popd >/dev/null || die
	einstalldocs
}
