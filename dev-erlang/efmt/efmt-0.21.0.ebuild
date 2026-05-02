# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.4
	anstream@0.6.21
	anstyle-parse@0.2.7
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.13
	bstr@1.12.1
	colorchoice@1.0.4
	colored@3.1.1
	console@0.15.11
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	either@1.15.0
	encode_unicode@1.0.0
	env_filter@1.0.0
	env_logger@0.11.9
	erl_tokenize@0.10.0
	globset@0.4.18
	ignore@0.4.25
	indoc@2.0.7
	is_terminal_polyfill@1.70.2
	jiff-static@0.2.20
	jiff@0.2.20
	libc@0.2.181
	log@0.4.29
	memchr@2.8.0
	noargs@0.4.2
	once_cell@1.21.3
	once_cell_polyfill@1.70.2
	portable-atomic-util@0.2.5
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	quote@1.0.44
	rayon-core@1.13.0
	rayon@1.11.0
	regex-automata@0.4.14
	regex-syntax@0.8.9
	regex@1.12.3
	rustversion@1.0.22
	same-file@1.0.6
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	similar-asserts@1.7.0
	similar@2.7.0
	syn@2.0.115
	unicode-ident@1.0.23
	unicode-segmentation@1.12.0
	unicode-width@0.2.2
	utf8parse@0.2.2
	walkdir@2.5.0
	winapi-util@0.1.11
	windows-link@0.2.1
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

RUST_MIN_VER="1.88"

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
