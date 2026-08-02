# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	anyhow@1.0.99
	argh@0.1.13
	argh_derive@0.1.13
	argh_shared@0.1.13
	bincode@1.3.3
	bitflags@1.3.2
	bitflags@2.9.1
	cfg-if@1.0.0
	equivalent@1.0.1
	errno@0.3.13
	fastrand@2.3.0
	getopts@0.2.21
	getrandom@0.3.3
	hashbrown@0.15.5
	heck@0.5.0
	indexmap@2.10.0
	itoa@1.0.9
	libc@0.2.175
	linux-raw-sys@0.9.4
	log@0.4.27
	memchr@2.5.0
	once_cell@1.21.3
	proc-macro2@1.0.97
	pulldown-cmark@0.7.2
	quote@1.0.40
	r-efi@5.3.0
	rust-fuzzy-search@0.1.1
	rustix@1.0.8
	rustversion@1.0.14
	ryu@1.0.15
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.142
	serde_spanned@0.6.9
	strip_markdown@0.2.0
	strum@0.26.3
	strum_macros@0.26.4
	syn@2.0.104
	tempfile@3.20.0
	toml@0.8.23
	toml_datetime@0.6.11
	toml_edit@0.22.27
	toml_write@0.1.2
	unicase@2.6.0
	unicode-ident@1.0.11
	unicode-width@0.1.10
	version_check@0.9.4
	wasi@0.14.2+wasi-0.2.4
	windows-link@0.1.3
	windows-sys@0.59.0
	windows-sys@0.60.2
	windows-targets@0.52.6
	windows-targets@0.53.3
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.0
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.0
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.0
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.0
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.0
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.0
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.0
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.0
	winnow@0.7.12
	wit-bindgen-rt@0.39.0
	xorf@0.11.0
"

RUST_MIN_VER="1.85.0"

inherit cargo

DESCRIPTION="Tiny, full-text search engine for static websites built with Rust and Wasm"
HOMEPAGE="https://github.com/tinysearch/tinysearch"
SRC_URI="
	https://github.com/tinysearch/tinysearch/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT ) BSD MIT Unicode-DFS-2016 || ( Apache-2.0 Boost-1.0 )"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	cargo_src_compile --features=bin
}

src_install() {
	cargo_src_install --features=bin
	dodoc README.md
}
