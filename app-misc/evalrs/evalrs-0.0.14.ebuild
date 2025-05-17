# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	bitflags@2.9.0
	cfg-if@1.0.0
	errno@0.3.11
	fastrand@2.3.0
	getrandom@0.3.2
	libc@0.2.172
	linux-raw-sys@0.9.4
	memchr@2.7.4
	noargs@0.3.2
	once_cell@1.21.3
	r-efi@5.2.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	rustix@1.0.7
	tempfile@3.19.1
	wasi@0.14.2+wasi-0.2.4
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	wit-bindgen-rt@0.39.0
"

inherit cargo

DESCRIPTION="Rust code snippet evaluator"
HOMEPAGE="https://github.com/sile/evalrs"
SRC_URI="
	https://github.com/sile/evalrs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
