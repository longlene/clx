# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-0.7.18
	ansi_term-0.9.0
	anyhow-1.0.57
	arrayvec-0.7.2
	assert_cmd-1.0.8
	atty-0.2.14
	autocfg-1.1.0
	base64-0.12.3
	bigdecimal-0.2.2
	bitflags-0.9.1
	bitflags-1.3.2
	bstr-0.2.17
	byteorder-1.4.3
	bytes-0.4.12
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.27.1
	colored-2.0.0
	delegate-0.5.2
	difflib-0.4.0
	doc-comment-0.3.3
	either-1.6.1
	getrandom-0.2.6
	hermit-abi-0.1.19
	ion-rs-0.12.0
	ion-schema-0.4.0
	iovec-0.1.4
	itertools-0.10.3
	lazy_static-1.4.0
	libc-0.2.126
	memchr-2.5.0
	memmap-0.7.0
	minimal-lexical-0.2.1
	nom-7.1.1
	num-bigint-0.3.3
	num-integer-0.1.45
	num-traits-0.2.15
	pest-2.1.3
	ppv-lite86-0.2.16
	predicates-2.1.1
	predicates-core-1.0.3
	predicates-tree-1.0.5
	proc-macro2-1.0.39
	quote-1.0.18
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	redox_syscall-0.2.13
	regex-1.6.0
	regex-automata-0.1.10
	regex-syntax-0.6.27
	remove_dir_all-0.5.3
	rstest-0.10.0
	rustc_version-0.3.3
	semver-0.11.0
	semver-parser-0.10.2
	strsim-0.6.0
	syn-1.0.95
	tempfile-3.2.0
	termtree-0.2.4
	textwrap-0.9.0
	thiserror-1.0.31
	thiserror-impl-1.0.31
	time-0.1.43
	ucd-trie-0.1.3
	unicode-ident-1.0.0
	unicode-width-0.1.9
	vec_map-0.8.2
	wait-timeout-0.2.0
	wasi-0.10.2+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Command line tool for working with the Ion data format"
HOMEPAGE="https://github.com/amzn/ion-cli"
SRC_URI="
	https://github.com/amzn/ion-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.31.0
"
