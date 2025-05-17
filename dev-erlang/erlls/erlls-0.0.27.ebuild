# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	autocfg@1.4.0
	colorchoice@1.0.3
	displaydoc@0.2.5
	efmt_core@0.5.3
	efmt_derive@0.1.0
	env_filter@0.1.3
	env_logger@0.11.6
	erl_tokenize@0.8.1
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
	humantime@2.1.0
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	idna@1.0.3
	idna_adapter@1.2.0
	is_terminal_polyfill@1.70.1
	itoa@1.0.15
	litemap@0.7.5
	log@0.4.26
	memchr@2.7.4
	num-bigint@0.4.6
	num-integer@0.1.46
	num-traits@0.2.19
	once_cell@1.20.3
	orfail@1.1.0
	percent-encoding@2.3.1
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	proc-macro2@1.0.94
	quote@1.0.39
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	ryu@1.0.20
	serde@1.0.218
	serde_derive@1.0.218
	serde_json@1.0.140
	slab@0.4.9
	smallvec@1.14.0
	stable_deref_trait@1.2.0
	syn@1.0.109
	syn@2.0.99
	synstructure@0.13.1
	tinystr@0.7.6
	unicode-ident@1.0.18
	url@2.5.4
	utf16_iter@1.0.5
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
	write16@1.0.0
	writeable@0.5.5
	yoke-derive@0.7.5
	yoke@0.7.5
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zerovec-derive@0.10.3
	zerovec@0.10.4
"

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
