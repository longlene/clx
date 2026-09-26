# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.11
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.6
	anyhow@1.0.79
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.10.0
	block2@0.6.2
	cc@1.0.83
	cfg-if@1.0.0
	clap@4.5.0
	clap_builder@4.5.0
	clap_derive@4.5.0
	clap_lex@0.7.0
	colorchoice@1.0.0
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	dispatch2@0.3.0
	either@1.13.0
	env_filter@0.1.3
	env_logger@0.11.8
	heck@0.4.1
	httparse@1.10.1
	itoa@1.0.18
	jiff-static@0.2.10
	jiff@0.2.10
	libc@0.2.153
	log@0.4.27
	mac_address@1.1.5
	memchr@2.7.4
	memoffset@0.6.5
	nix@0.23.2
	ntapi@0.4.1
	objc2-core-foundation@0.3.2
	objc2-encode@4.1.0
	objc2-io-kit@0.3.2
	objc2@0.6.3
	portable-atomic-util@0.2.4
	portable-atomic@1.11.0
	proc-macro2@1.0.95
	quote@1.0.40
	rayon-core@1.12.1
	rayon@1.10.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	strsim@0.11.0
	syn@2.0.101
	sysinfo@0.31.4
	unicode-ident@1.0.12
	utf8parse@0.2.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.57.0
	windows-implement@0.57.0
	windows-interface@0.57.0
	windows-result@0.1.2
	windows-sys@0.52.0
	windows-targets@0.52.6
	windows@0.57.0
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

DESCRIPTION="Launch configurable virtual machines with libkrun"
HOMEPAGE="https://github.com/libkrun/krunkit"
SRC_URI="
	https://github.com/libkrun/krunkit/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
LICENSE+=" MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libkrun"
RDEPEND="${DEPEND}"

# Upstream left the macOS-only timesync module and its dependencies
# (core-foundation, objc2-io-kit) un-gated, so the crate fails to build
# on Linux (objc2's compile_error! fires on non-Apple targets).
src_prepare() {
	default
	eapply "${FILESDIR}/krunkit-1.3.2-linux-build.patch"
}

src_install() {
	cargo_src_install
	dodoc AUTHORS LICENSE README.md docs/usage.md
}
