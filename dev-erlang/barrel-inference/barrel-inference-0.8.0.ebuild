# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# The Erlang app is named 'erllama', not '${PN}'
REBAR_APP_SRC="src/erllama.app.src"

inherit rebar3

DESCRIPTION="Erlang/OTP NIF wrapper around llama.cpp with token-exact tiered KV cache"
HOMEPAGE="https://github.com/barrel-platform/barrel_inference"
SRC_URI="https://github.com/barrel-platform/barrel_inference/archive/refs/tags/erllama-v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/barrel_inference-erllama-v${PV}/apps/barrel_inference"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/cmake"

src_prepare() {
	rebar3_src_prepare
	# project_plugins (rebar3_hex, rebar3_ex_doc, etc.) are publish/dev tools
	sed -i '/^{project_plugins,/,/^\]}\./d' rebar.config || die
	# warnings_as_errors breaks on new-pattern diagnostics in newer OTP
	sed -i 's/, warnings_as_errors//' rebar.config || die
}

src_install() {
	# Erlang app is 'erllama'; rebar3_src_install looks for ${PN} and would not find it
	rebar3_install_lib "_build/default/lib/erllama"
	# priv/ in _build is a symlink — install the NIF from the source priv/ directory
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
}
