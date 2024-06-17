# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.2
	anstream@0.6.12
	anstyle@1.0.6
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anyhow@1.0.79
	autocfg@1.1.0
	bitflags@2.4.2
	bstr@0.2.17
	cfg-if@1.0.0
	clap@4.5.1
	clap_builder@4.5.1
	clap_derive@4.5.0
	clap_lex@0.7.0
	colorchoice@1.0.0
	console@0.15.8
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	either@1.10.0
	encode_unicode@0.3.6
	env_filter@0.1.0
	env_logger@0.11.2
	erl_tokenize@0.6.1
	errno@0.3.8
	fastrand@2.0.1
	heck@0.4.1
	humantime@2.1.0
	indoc@2.0.4
	lazy_static@1.4.0
	libc@0.2.153
	linux-raw-sys@0.4.13
	log@0.4.20
	memchr@2.7.1
	num@0.4.1
	num-bigint@0.4.4
	num-complex@0.4.5
	num-integer@0.1.46
	num-iter@0.1.44
	num-rational@0.4.1
	num-traits@0.2.18
	proc-macro2@1.0.78
	quote@1.0.35
	rayon@1.8.1
	rayon-core@1.12.1
	regex@1.10.3
	regex-automata@0.1.10
	regex-automata@0.4.5
	regex-syntax@0.8.2
	rustix@0.38.31
	serde@1.0.196
	serde_derive@1.0.196
	similar@2.4.0
	similar-asserts@1.5.0
	strsim@0.11.0
	syn@2.0.49
	tempfile@3.10.0
	thiserror@1.0.57
	thiserror-impl@1.0.57
	unicode-ident@1.0.12
	unicode-segmentation@1.11.0
	utf8parse@0.2.1
	windows-sys@0.52.0
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.52.0
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
