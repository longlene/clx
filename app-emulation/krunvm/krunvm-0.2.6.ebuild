# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	anstream@0.6.4
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.1
	anstyle@1.0.4
	arrayref@0.3.6
	arrayvec@0.5.2
	autocfg@1.0.1
	base64@0.13.0
	bitflags@2.4.0
	blake2b_simd@0.5.11
	cfg-if@0.1.10
	cfg-if@1.0.0
	clap@4.4.6
	clap_builder@4.4.6
	clap_derive@4.4.2
	clap_lex@0.5.1
	colorchoice@1.0.0
	confy@0.4.0
	constant_time_eq@0.1.5
	crossbeam-utils@0.8.3
	directories@2.0.2
	dirs-sys@0.3.5
	getrandom@0.1.16
	heck@0.4.1
	lazy_static@1.4.0
	libc@0.2.149
	memoffset@0.9.0
	nix@0.27.1
	proc-macro2@1.0.69
	quote@1.0.33
	redox_syscall@0.1.57
	redox_users@0.3.5
	rust-argon2@0.8.3
	serde@1.0.124
	serde_derive@1.0.124
	strsim@0.10.0
	syn@1.0.64
	syn@2.0.38
	text_io@0.1.8
	toml@0.5.8
	unicode-ident@1.0.12
	unicode-xid@0.2.1
	utf8parse@0.2.1
	wasi@0.9.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
"

inherit cargo

DESCRIPTION="Create microVMs from OCI images"
HOMEPAGE="https://github.com/libkrun/krunvm"
SRC_URI="
	https://github.com/libkrun/krunvm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
LICENSE+=" BSD-2 CC0-1.0 MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libkrun"
RDEPEND="
	${DEPEND}
	app-containers/buildah
"
BDEPEND="dev-ruby/asciidoctor"

src_install() {
	cargo_src_install

	local man_out
	man_out=$(find "target/$(usex debug debug release)/build" -maxdepth 1 -name 'krunvm-*' -type d | head -n1)
	[[ -n ${man_out} ]] && doman "${man_out}"/out/krunvm*.1

	dodoc README.md
}
