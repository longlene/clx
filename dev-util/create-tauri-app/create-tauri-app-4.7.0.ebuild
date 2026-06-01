# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler32@1.2.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	anyhow@1.0.98
	bitflags@2.6.0
	block-buffer@0.10.4
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	console@0.15.8
	convert_case@0.6.0
	core2@0.4.0
	cpufeatures@0.2.13
	crc32fast@1.4.2
	crypto-common@0.1.6
	ctor@0.2.8
	ctrlc@3.4.7
	dary_heap@0.3.6
	dialoguer@0.11.0
	digest@0.10.7
	dirs-sys@0.4.1
	dirs@5.0.1
	encode_unicode@0.3.6
	errno@0.3.9
	fastrand@2.1.0
	generic-array@0.14.7
	getrandom@0.2.15
	hashbrown@0.14.5
	include-flate-codegen@0.2.0
	include-flate@0.3.0
	lazy_static@1.5.0
	libc@0.2.174
	libflate@2.1.0
	libflate_lz77@2.1.0
	libloading@0.8.5
	libredox@0.1.3
	linux-raw-sys@0.4.14
	memchr@2.7.4
	napi-build@2.2.3
	napi-derive-backend@1.0.75
	napi-derive@2.16.13
	napi-sys@2.4.0
	napi@2.16.17
	nix@0.30.1
	once_cell@1.19.0
	option-ext@0.2.0
	pico-args@0.5.0
	proc-macro2@1.0.86
	quote@1.0.36
	redox_syscall@0.5.13
	redox_users@0.4.6
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	rle-decode-fast@1.0.3
	rust-embed-impl@8.7.2
	rust-embed-utils@8.7.2
	rust-embed@8.7.2
	rustix@0.38.34
	same-file@1.0.6
	semver@1.0.23
	sha2@0.10.8
	shell-words@1.1.0
	shellexpand@3.1.0
	syn@2.0.75
	tempfile@3.12.0
	thiserror-impl@1.0.63
	thiserror@1.0.63
	typenum@1.17.0
	unicode-ident@1.0.12
	unicode-segmentation@1.11.0
	unicode-width@0.1.13
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasite@0.1.0
	whoami@1.6.0
	winapi-util@0.1.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zeroize@1.8.1
"

RUST_MIN_VER="1.80"

inherit cargo

DESCRIPTION="Rapidly scaffold out a new tauri app project."
HOMEPAGE="https://github.com/tauri-apps/create-tauri-app"
SRC_URI="
	https://github.com/tauri-apps/create-tauri-app/archive/refs/tags/create-tauri-app-v${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
S="${WORKDIR}"/create-tauri-app-create-tauri-app-v${PV}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_install() {
	cargo_src_install
	einstalldocs
}
