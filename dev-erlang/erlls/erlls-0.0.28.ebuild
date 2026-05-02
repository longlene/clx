# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.19
	anstyle-parse@0.2.7
	anstyle-query@1.1.3
	anstyle-wincon@3.0.9
	anstyle@1.0.11
	autocfg@1.5.0
	colorchoice@1.0.4
	displaydoc@0.2.5
	efmt_core@0.5.3
	efmt_derive@0.1.0
	env_filter@0.1.3
	env_logger@0.11.8
	erl_tokenize@0.8.3
	form_urlencoded@1.2.1
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	icu_collections@2.0.0
	icu_locale_core@2.0.0
	icu_normalizer@2.0.0
	icu_normalizer_data@2.0.0
	icu_properties@2.0.1
	icu_properties_data@2.0.1
	icu_provider@2.0.0
	idna@1.0.3
	idna_adapter@1.2.1
	is_terminal_polyfill@1.70.1
	itoa@1.0.15
	jiff-static@0.2.15
	jiff@0.2.15
	litemap@0.8.0
	log@0.4.27
	memchr@2.7.5
	num-bigint@0.4.6
	num-integer@0.1.46
	num-traits@0.2.19
	once_cell_polyfill@1.70.1
	orfail@1.1.0
	percent-encoding@2.3.1
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	portable-atomic-util@0.2.4
	portable-atomic@1.11.1
	potential_utf@0.1.2
	proc-macro2@1.0.95
	quote@1.0.40
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	ryu@1.0.20
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.142
	slab@0.4.10
	smallvec@1.15.1
	stable_deref_trait@1.2.0
	syn@1.0.109
	syn@2.0.104
	synstructure@0.13.2
	tinystr@0.8.1
	unicode-ident@1.0.18
	url@2.5.4
	utf8_iter@1.0.4
	utf8parse@0.2.2
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
	writeable@0.6.1
	yoke-derive@0.8.0
	yoke@0.8.0
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zerotrie@0.2.2
	zerovec-derive@0.11.1
	zerovec@0.11.2
"

RUST_MIN_VER="1.82"

inherit cargo

DESCRIPTION="Erlang language server"
HOMEPAGE="https://github.com/sile/erlls"
SRC_URI="
	https://github.com/sile/erlls/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
