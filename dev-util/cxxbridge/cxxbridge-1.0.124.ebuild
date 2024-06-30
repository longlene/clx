# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	anstyle@1.0.7
	cc@1.0.100
	cfg-if@1.0.0
	clang-ast@0.1.25
	clap@4.5.7
	clap_builder@4.5.7
	clap_lex@0.7.1
	codespan-reporting@0.11.1
	crc32fast@1.4.2
	dissimilar@1.0.9
	equivalent@1.0.1
	flate2@1.0.30
	glob@0.3.1
	hashbrown@0.14.5
	indexmap@2.2.6
	itoa@1.0.11
	jobserver@0.1.31
	libc@0.2.155
	link-cplusplus@1.0.9
	memchr@2.7.4
	memmap@0.7.0
	miniz_oxide@0.7.4
	once_cell@1.19.0
	pkg-config@0.3.30
	proc-macro2@1.0.86
	quote@1.0.36
	rustc-hash@2.0.0
	rustversion@1.0.17
	ryu@1.0.18
	scratch@1.0.7
	serde@1.0.203
	serde_derive@1.0.203
	serde_json@1.0.117
	serde_spanned@0.6.6
	strsim@0.11.1
	syn@2.0.68
	termcolor@1.4.1
	toml@0.8.14
	toml_datetime@0.6.6
	toml_edit@0.22.14
	trybuild@1.0.96
	unicode-ident@1.0.12
	unicode-width@0.1.13
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.52.0
	windows-targets@0.52.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.52.5
	winnow@0.6.13
"

inherit cargo

DESCRIPTION="C++ code generator for integrating cxx crate into a non-Cargo build"
HOMEPAGE="https://cxx.rs"
SRC_URI="
	https://github.com/dtolnay/cxx/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/cxx-${PV}/gen/cmd
DOCS=( "${WORKDIR}"/cxx-${PV}/README.md )

src_install() {
	cargo_src_install
	einstalldocs
}
