# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="LLM gateway for the BEAM with virtual keys, cost ledger and audit"
HOMEPAGE="https://github.com/Taure/sekisho"
SRC_URI="https://github.com/Taure/sekisho/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/kura
	dev-erlang/kura-postgres
	dev-erlang/nova
	dev-erlang/pgo
"
DEPEND="${RDEPEND}"

src_prepare() {
	# Remove provider_hooks (references kura pre-compile hook — dep is removed by eclass)
	sed -i '/^{provider_hooks/,/^]}\./d' rebar.config || die
	# Remove project_plugins (build/dev tools, all fetch from network)
	sed -i '/^{project_plugins/,/^]}\./d' rebar.config || die
	rebar3_src_prepare
}

src_compile() {
	erebar3 compile || die
}

src_install() {
	rebar3_src_install
	# priv/ in _build/ is a symlink — install from source tree manually
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins -r "${S}"/priv/.
}
