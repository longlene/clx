# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.25.1
	adler2@2.0.1
	aho-corasick@1.1.4
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	argparse@0.2.2
	backtrace@0.3.76
	base64@0.22.1
	bincode@1.3.3
	bitflags@2.11.1
	cc@1.2.60
	cfg-if@1.0.4
	colorchoice@1.0.5
	crc32fast@1.5.0
	deranged@0.5.8
	env_filter@1.0.1
	env_logger@0.11.10
	equivalent@1.0.2
	fastrand@2.4.1
	find-msvc-tools@0.1.9
	flate2@1.1.9
	fnv@1.0.7
	gimli@0.32.3
	hashbrown@0.17.0
	html5ever@0.39.0
	indexmap@2.14.0
	is_terminal_polyfill@1.70.2
	itoa@1.0.18
	jiff-static@0.2.23
	jiff@0.2.23
	libc@0.2.185
	linked-hash-map@0.5.6
	lock_api@0.4.14
	log@0.4.29
	markup5ever@0.39.0
	memchr@2.8.0
	miniz_oxide@0.8.9
	new_debug_unreachable@1.0.6
	nom@8.0.0
	num-conv@0.1.0
	numtoa@0.2.4
	object@0.37.3
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	onig@6.5.1
	onig_sys@69.9.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	phf@0.13.1
	phf_codegen@0.13.1
	phf_generator@0.13.1
	phf_shared@0.13.1
	pkg-config@0.3.33
	plist@1.8.0
	portable-atomic-util@0.2.7
	portable-atomic@1.13.1
	powerfmt@0.2.0
	precomputed-hash@0.1.1
	proc-macro2@1.0.106
	quick-xml@0.38.4
	quote@1.0.45
	redox_syscall@0.5.18
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	rustc-demangle@0.1.27
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	shlex@1.3.0
	simd-adler32@0.3.9
	siphasher@1.0.2
	smallvec@1.15.1
	string_cache@0.9.0
	string_cache_codegen@0.6.1
	syn@2.0.117
	syntect@5.3.0
	tendril@0.5.0
	termion@4.0.6
	thiserror-impl@2.0.18
	thiserror@2.0.18
	time-core@0.1.7
	time-macros@0.2.25
	time@0.3.45
	unicode-ident@1.0.24
	unicode-width@0.2.2
	utf-8@0.7.6
	utf8parse@0.2.2
	walkdir@2.5.0
	web_atoms@0.2.4
	winapi-util@0.1.11
	windows-link@0.2.1
	windows-sys@0.61.2
	xml5ever@0.39.0
	yaml-rust@0.4.5
	zmij@1.0.21
"

RUST_MIN_VER="1.85.0"

inherit cargo

DESCRIPTION="Rust library to render HTML as plain text, with html2text CLI"
HOMEPAGE="https://github.com/jugglerchris/rust-html2text"
SRC_URI="
	https://github.com/jugglerchris/rust-html2text/archive/refs/tags/release_${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/${PN}-release_${PV}"

LICENSE="MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/oniguruma:="
RDEPEND="${DEPEND}"

src_install() {
	cargo_src_install --path ./html2text-cli
	dodoc README.md
}
