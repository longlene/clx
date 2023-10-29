# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-1.0.5
	ansi_term-0.12.1
	anstream-0.5.0
	anstyle-1.0.3
	anstyle-parse-0.2.1
	anstyle-query-1.0.0
	anstyle-wincon-2.1.0
	anyhow-1.0.75
	atty-0.2.14
	autocfg-1.1.0
	bitflags-0.7.0
	bitflags-1.3.2
	bitflags-2.4.0
	byteorder-1.4.3
	cc-1.0.83
	cfg-if-1.0.0
	clap-4.4.3
	clap_builder-4.4.2
	clap_derive-4.4.2
	clap_lex-0.5.1
	colorchoice-1.0.0
	comfy-table-7.0.1
	crossterm-0.26.1
	crossterm_winapi-0.9.1
	heck-0.4.1
	hermit-abi-0.1.19
	itoa-1.0.9
	libc-0.2.148
	linux-personality-1.0.0
	lock_api-0.4.10
	log-0.4.20
	memchr-2.6.3
	mio-0.8.8
	nix-0.27.1
	parking_lot-0.12.1
	parking_lot_core-0.9.8
	proc-macro2-1.0.67
	quote-1.0.33
	redox_syscall-0.3.5
	regex-1.9.5
	regex-automata-0.3.8
	regex-syntax-0.7.5
	rustversion-1.0.14
	ryu-1.0.15
	scopeguard-1.2.0
	serde-1.0.188
	serde_derive-1.0.188
	serde_json-1.0.107
	serde_repr-0.1.16
	signal-hook-0.3.17
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.1
	smallvec-1.11.0
	strsim-0.10.0
	strum-0.24.1
	strum_macros-0.24.3
	syn-1.0.109
	syn-2.0.36
	syscalls-0.6.14
	unicode-ident-1.0.12
	unicode-width-0.1.10
	users-0.11.0
	utf8parse-0.2.1
	wasi-0.11.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.48.0
	windows-targets-0.48.5
	windows_aarch64_gnullvm-0.48.5
	windows_aarch64_msvc-0.48.5
	windows_i686_gnu-0.48.5
	windows_i686_msvc-0.48.5
	windows_x86_64_gnu-0.48.5
	windows_x86_64_gnullvm-0.48.5
	windows_x86_64_msvc-0.48.5
"

inherit cargo

DESCRIPTION="A pretty (simple) alternative to strace"
HOMEPAGE="https://github.com/JakWai01/lurk"
SRC_URI="
	https://github.com/JakWai01/lurk/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.31.0
"

