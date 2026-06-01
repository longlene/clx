# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang/OTP LLM inference runtime with tiered KV cache and llama.cpp NIF"
HOMEPAGE="https://github.com/barrel-platform/barrel_inference"
SRC_URI="https://github.com/barrel-platform/barrel_inference/archive/refs/tags/erllama-v${PV}.tar.gz
	-> barrel-inference-${P}.tar.gz"
S="${WORKDIR}/barrel_inference-erllama-v${PV}/apps/barrel_inference"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/cmake"

src_compile() {
	erebar3 compile
}

src_install() {
	rebar3_install_lib "${S}/_build/default/lib/${PN}"
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}
