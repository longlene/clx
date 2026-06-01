# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	accessibility-sys@0.2.0
	aho-corasick@1.1.4
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.13
	base64@0.22.1
	bitflags@2.11.0
	cfg-if@1.0.4
	clap@4.6.1
	clap_builder@4.6.0
	clap_derive@4.6.1
	clap_lex@1.0.0
	colorchoice@1.0.4
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	core-graphics-types@0.2.0
	core-graphics@0.25.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	heck@0.5.0
	is_terminal_polyfill@1.70.2
	itoa@1.0.17
	lazy_static@1.5.0
	libc@0.2.186
	log@0.4.29
	matchers@0.2.0
	memchr@2.8.0
	nu-ansi-term@0.50.3
	once_cell@1.21.3
	once_cell_polyfill@1.70.2
	pin-project-lite@0.2.16
	proc-macro2@1.0.106
	quote@1.0.45
	regex-automata@0.4.14
	regex-syntax@0.8.9
	rustc-hash@2.1.2
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	sharded-slab@0.1.7
	smallvec@1.15.1
	strsim@0.11.1
	syn@2.0.117
	thiserror-impl@2.0.18
	thiserror@2.0.18
	thread_local@1.1.9
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing-log@0.2.0
	tracing-subscriber@0.3.23
	tracing@0.1.44
	unicode-ident@1.0.24
	utf8parse@0.2.2
	valuable@0.1.1
	windows-link@0.2.1
	windows-sys@0.61.2
	zmij@1.0.21
"

RUST_MIN_VER="1.85.0"

inherit cargo

DESCRIPTION="Native desktop automation CLI for AI agents using OS accessibility trees"
HOMEPAGE="https://github.com/lahfir/agent-desktop"
SRC_URI="
	https://github.com/lahfir/agent-desktop/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
LICENSE+=" MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	cargo_src_compile --package agent-desktop
}

src_install() {
	cargo_src_install --path src
}
