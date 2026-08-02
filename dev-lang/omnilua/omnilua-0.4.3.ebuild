# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.88.0"

CRATES="
	addr2line@0.25.1
	adler2@2.0.1
	backtrace@0.3.76
	bitflags@2.13.0
	cc@1.2.65
	cfg-if@1.0.4
	cfg_aliases@0.1.1
	clipboard-win@5.4.1
	dhat@0.3.3
	endian-type@0.1.2
	errno@0.3.14
	error-code@3.3.2
	fd-lock@4.0.4
	filetime@0.2.29
	find-msvc-tools@0.1.9
	gimli@0.32.3
	home@0.5.12
	itoa@1.0.18
	lazy_static@1.5.0
	libc@0.2.186
	libloading@0.9.0
	libmimalloc-sys@0.1.49
	linux-raw-sys@0.12.1
	lock_api@0.4.14
	log@0.4.33
	memchr@2.8.2
	mimalloc@0.1.52
	miniz_oxide@0.8.9
	mintex@0.1.4
	nibble_vec@0.1.0
	nix@0.28.0
	object@0.37.3
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	proc-macro2@1.0.106
	quote@1.0.46
	radix_trie@0.2.1
	redox_syscall@0.5.18
	rustc-demangle@0.1.27
	rustc-hash@1.1.0
	rustix@1.1.4
	rustyline@14.0.0
	scopeguard@1.2.0
	serde@1.0.228
	serde_bytes@0.11.19
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	shlex@2.0.1
	smallvec@1.15.2
	syn@2.0.118
	thousands@0.2.0
	unicode-ident@1.0.24
	unicode-segmentation@1.13.3
	unicode-width@0.1.14
	utf8parse@0.2.2
	windows-link@0.2.1
	windows-sys@0.52.0
	windows-sys@0.59.0
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
	zmij@1.0.21
"

inherit cargo

DESCRIPTION="Pure-Rust Lua 5.1-5.5 runtime, suite-passing and LuaRocks-compatible"
HOMEPAGE="https://github.com/ianm199/omnilua"
SRC_URI="
	https://github.com/ianm199/omnilua/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT Apache-2.0 Boost-1.0 ISC Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	cargo_src_compile --manifest-path crates/lua-cli/Cargo.toml
}

src_install() {
	cargo_src_install --path crates/lua-cli
	dodoc README.md
}
