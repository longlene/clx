# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

# Pinned by scripts/wasmtime.version; the full C API tarball is statically
# linked into the NIF by scripts/build-nif.sh (no network at build time).
WASM_VER="48.0.1"

DESCRIPTION="Wasmtime bindings for Erlang: run WebAssembly, call Erlang from guest"
HOMEPAGE="https://github.com/benoitc/erlang-wasmtime"
SRC_URI="
	https://github.com/benoitc/erlang-wasmtime/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	amd64? ( https://github.com/bytecodealliance/wasmtime/releases/download/v${WASM_VER}/wasmtime-v${WASM_VER}-x86_64-linux-c-api.tar.xz )
	arm64? ( https://github.com/bytecodealliance/wasmtime/releases/download/v${WASM_VER}/wasmtime-v${WASM_VER}-aarch64-linux-c-api.tar.xz )
"
# The app is named erlang_wasmtime (underscore), PN has a hyphen.
REBAR_APP_SRC="src/erlang_wasmtime.app.src"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

src_compile() {
	# Point the NIF build at the distfile instead of the script's
	# download-from-releases fallback.
	if use amd64; then
		local -x WASMTIME_C_API_DIR="${WORKDIR}/wasmtime-v${WASM_VER}-x86_64-linux-c-api"
	else
		local -x WASMTIME_C_API_DIR="${WORKDIR}/wasmtime-v${WASM_VER}-aarch64-linux-c-api"
	fi
	rebar3_src_compile
}

src_install() {
	# rebar3_src_install looks for _build/default/lib/${PN}; the app
	# directory is named erlang_wasmtime.
	pushd "_build/default" || die
	ln -s erlang_wasmtime "lib/${PN}" || die
	popd
	rebar3_src_install

	# priv/ in the build tree is a symlink and skipped by the eclass;
	# install the NIF, platform marker and precompiled shims from source.
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins -r "${S}"/priv/shims
	doins "${S}"/priv/wasmtime_nif.so
	doins "${S}"/priv/wasmtime_platform
}
