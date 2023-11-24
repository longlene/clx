# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-1.0.2
	anstream-0.3.2
	anstyle-1.0.1
	anstyle-parse-0.2.1
	anstyle-query-1.0.0
	anstyle-wincon-1.0.1
	autocfg-1.1.0
	bitflags-2.3.3
	cc-1.0.79
	cfg-if-1.0.0
	clap-4.3.10
	clap_builder-4.3.10
	clap_derive-4.3.2
	clap_lex-0.5.0
	colorchoice-1.0.0
	env_logger-0.10.0
	errno-0.3.1
	errno-dragonfly-0.1.2
	getrandom-0.2.10
	heck-0.4.1
	hermit-abi-0.3.1
	humantime-2.1.0
	is-terminal-0.4.8
	libc-0.2.147
	libm-0.2.7
	linux-raw-sys-0.4.3
	log-0.4.19
	memchr-2.5.0
	num-bigint-0.4.3
	num-integer-0.1.45
	num-traits-0.2.15
	once_cell-1.18.0
	ppv-lite86-0.2.17
	proc-macro2-1.0.63
	quote-1.0.29
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	rand_distr-0.4.3
	regex-1.8.4
	regex-syntax-0.7.2
	rustix-0.38.2
	strsim-0.10.0
	syn-2.0.23
	termcolor-1.2.0
	triple_accel-0.4.0
	unicode-ident-1.0.9
	utf8parse-0.2.1
	wasi-0.11.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.48.0
	windows-targets-0.48.1
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.48.0
"

inherit cargo

EGIT_COMMIT="a1191e08f30aa40ba543d8861628e3069400738e"

DESCRIPTION="A fuzzer for the Erlang ecosystem"
HOMEPAGE="https://github.com/WhatsApp/erlfuzz"
SRC_URI="
	https://github.com/WhatsApp/erlfuzz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_install() {
	cargo_src_install
	einstalldocs
}
