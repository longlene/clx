# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.95
	autocfg@1.4.0
	bstr@1.11.3
	clap@4.5.29
	clap_builder@4.5.29
	clap_derive@4.5.28
	clap_lex@0.7.4
	colorchoice@1.0.3
	colored@3.0.0
	console@0.15.10
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	either@1.13.0
	encode_unicode@1.0.0
	env_filter@0.1.3
	env_logger@0.11.6
	erl_tokenize@0.8.1
	globset@0.4.15
	heck@0.5.0
	humantime@2.1.0
	ignore@0.4.23
	indoc@2.0.5
	is_terminal_polyfill@1.70.1
	libc@0.2.169
	log@0.4.25
	memchr@2.7.4
	num-bigint@0.4.6
	num-integer@0.1.46
	num-traits@0.2.19
	once_cell@1.20.3
	proc-macro2@1.0.93
	quote@1.0.38
	rayon-core@1.12.1
	rayon@1.10.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	same-file@1.0.6
	serde@1.0.217
	serde_derive@1.0.217
	similar-asserts@1.6.1
	similar@2.7.0
	strsim@0.11.1
	syn@2.0.98
	unicode-ident@1.0.16
	unicode-segmentation@1.12.0
	utf8parse@0.2.2
	walkdir@2.5.0
	winapi-util@0.1.9
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
"

inherit cargo


DESCRIPTION="Erlang code formatter"
HOMEPAGE="https://github.com/sile/efmt"
SRC_URI="
	https://github.com/sile/efmt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.31.0
"

src_install() {
	cargo_src_install
	einstalldocs
}
