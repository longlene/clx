# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	bitflags@2.11.1
	cfg-if@1.0.4
	cfg_aliases@0.1.1
	clipboard-win@5.4.1
	endian-type@0.1.2
	errno@0.3.14
	error-code@3.3.2
	fd-lock@4.0.4
	filetime@0.2.29
	home@0.5.12
	libc@0.2.186
	libloading@0.9.0
	linux-raw-sys@0.12.1
	log@0.4.30
	memchr@2.8.0
	nibble_vec@0.1.0
	nix@0.28.0
	radix_trie@0.2.1
	rustix@1.1.4
	rustyline@14.0.0
	smallvec@1.15.1
	unicode-segmentation@1.13.2
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
"

inherit cargo

RUST_MIN_VER="1.88.0"

DESCRIPTION="Lua 5.4.7 interpreter written in Rust"
HOMEPAGE="https://ianm199.github.io/lua-rs/ https://github.com/ianm199/lua-rs"
SRC_URI="
	https://github.com/ianm199/lua-rs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Boost-1.0 ISC MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	cargo_src_install --path crates/lua-cli
	einstalldocs
}
