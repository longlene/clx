# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.2
	anstream@0.6.4
	anstyle@1.0.4
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.1
	anyhow@1.0.75
	assert_cmd@2.0.12
	bitflags@1.3.2
	bitflags@2.4.1
	bstr@1.7.0
	cfg-if@1.0.0
	clap@4.4.7
	clap_builder@4.4.7
	clap_derive@4.4.7
	clap_lex@0.6.0
	colorchoice@1.0.0
	colored@2.0.4
	csv@1.3.0
	csv-core@0.1.11
	difflib@0.4.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	doc-comment@0.3.3
	either@1.9.0
	encode_unicode@1.0.0
	errno@0.3.5
	fastrand@2.0.1
	getrandom@0.2.10
	heck@0.4.1
	hermit-abi@0.3.3
	is-terminal@0.4.9
	itertools@0.11.0
	itoa@1.0.9
	lazy_static@1.4.0
	libc@0.2.149
	linux-raw-sys@0.4.10
	memchr@2.6.4
	natord@1.0.9
	predicates@3.0.4
	predicates-core@1.0.6
	predicates-tree@1.0.9
	prettytable-rs@0.10.0
	proc-macro2@1.0.69
	quote@1.0.33
	redox_syscall@0.2.16
	redox_syscall@0.4.1
	redox_users@0.4.3
	regex@1.10.2
	regex-automata@0.4.3
	regex-syntax@0.8.2
	rustix@0.38.21
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	serde@1.0.190
	serde_derive@1.0.190
	serde_json@1.0.107
	strsim@0.10.0
	syn@2.0.38
	tempfile@3.8.1
	term@0.7.0
	termtree@0.4.1
	thiserror@1.0.50
	thiserror-impl@1.0.50
	unicode-ident@1.0.12
	unicode-width@0.1.11
	utf8parse@0.2.1
	wait-timeout@0.2.0
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
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

DESCRIPTION="Batch rename utility for developers"
HOMEPAGE="https://github.com/yaa110/nomino"
SRC_URI="
	https://github.com/yaa110/nomino/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/strip = true/d' \
		-i Cargo.toml
}

src_install() {
	cargo_src_install
	einstalldocs
}
