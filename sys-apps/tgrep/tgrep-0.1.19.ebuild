# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.102
	assert_cmd@2.2.0
	autocfg@1.5.0
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@1.3.2
	bitflags@2.11.0
	bstr@1.12.1
	cfg-if@1.0.4
	clap@4.6.0
	clap_builder@4.6.0
	clap_derive@4.6.0
	clap_lex@1.1.0
	colorchoice@1.0.5
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	difflib@0.4.0
	either@1.15.0
	equivalent@1.0.2
	errno@0.3.14
	fancy-regex@0.14.0
	fastrand@2.3.0
	filetime@0.2.27
	float-cmp@0.10.0
	foldhash@0.1.5
	foldhash@0.2.0
	fs2@0.4.3
	fsevent-sys@4.1.0
	getrandom@0.4.2
	globset@0.4.18
	hashbrown@0.15.5
	hashbrown@0.16.1
	heck@0.5.0
	id-arena@2.3.0
	ignore@0.4.25
	indexmap@2.13.1
	inotify-sys@0.1.5
	inotify@0.10.2
	instant@0.1.13
	is_terminal_polyfill@1.70.2
	itoa@1.0.18
	kqueue-sys@1.0.4
	kqueue@1.1.1
	leb128fmt@0.1.0
	libc@0.2.184
	libredox@0.1.15
	linux-raw-sys@0.12.1
	log@0.4.29
	lru@0.16.3
	memchr@2.8.0
	memmap2@0.9.10
	mio@1.2.0
	normalize-line-endings@0.3.0
	notify-types@1.0.1
	notify@7.0.0
	num-traits@0.2.19
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	plain@0.2.3
	predicates-core@1.0.10
	predicates-tree@1.0.13
	predicates@3.1.4
	prettyplease@0.2.37
	proc-macro2@1.0.106
	quote@1.0.45
	r-efi@6.0.0
	rayon-core@1.13.0
	rayon@1.11.0
	redox_syscall@0.7.3
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	rustix@1.1.4
	same-file@1.0.6
	semver@1.0.28
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	strsim@0.11.1
	syn@2.0.117
	tempfile@3.27.0
	termtree@0.5.1
	unicode-ident@1.0.24
	unicode-xid@0.2.6
	utf8parse@0.2.2
	wait-timeout@0.2.1
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.2+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasmparser@0.244.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-link@0.2.1
	windows-sys@0.52.0
	windows-sys@0.61.2
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-component@0.244.0
	wit-parser@0.244.0
	zmij@1.0.21
"

RUST_MIN_VER="1.87.0"

inherit cargo

DESCRIPTION="Trigram-indexed grep — fast regex search for large codebases with client/server architecture"
HOMEPAGE="https://github.com/microsoft/tgrep"
SRC_URI="
	https://github.com/microsoft/tgrep/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${P}/tgrep-cli

src_install() {
	cargo_src_install
	einstalldocs
}
