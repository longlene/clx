# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.88.0"

CRATES="
	adler2@2.0.1
	aho-corasick@1.1.5
	anstream@1.0.0
	anstyle@1.0.14
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	arbitrary@1.4.2
	arrayref@0.3.9
	arrayvec@0.7.8
	async-trait@0.1.92
	base64@0.23.1
	bitflags@2.13.1
	blake3@1.8.6
	bstr@1.13.1
	bumpalo@3.20.3
	bytes@1.12.1
	cc@1.4.2
	cfg-if@1.0.4
	clap@4.6.6
	clap_builder@4.6.6
	clap_derive@4.6.4
	clap_lex@1.1.0
	colorchoice@1.0.5
	constant_time_eq@0.4.2
	cpufeatures@0.3.0
	crc32fast@1.5.0
	crossbeam-deque@0.8.7
	crossbeam-epoch@0.9.20
	crossbeam-utils@0.8.22
	derive_arbitrary@1.4.2
	displaydoc@0.2.7
	equivalent@1.0.2
	errno@0.3.14
	fastrand@2.5.0
	filetime@0.2.29
	find-msvc-tools@0.1.10
	flate2@1.1.9
	getrandom@0.2.17
	getrandom@0.4.3
	globset@0.4.20
	hashbrown@0.17.1
	heck@0.5.0
	http@1.5.0
	httparse@1.10.1
	ignore@0.4.33
	indexmap@2.14.0
	is_terminal_polyfill@1.70.2
	itoa@1.0.18
	libc@0.2.189
	linux-raw-sys@0.12.1
	log@0.4.33
	memchr@2.8.3
	miniz_oxide@0.8.9
	mio@1.2.2
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	percent-encoding@2.3.2
	pin-project-lite@0.2.17
	proc-macro2@1.0.107
	quote@1.0.47
	r-efi@6.0.0
	regex-automata@0.4.18
	regex-syntax@0.8.11
	ring@0.17.14
	rustix@1.1.4
	rustls@0.23.45
	rustls-pki-types@1.15.1
	rustls-webpki@0.103.15
	same-file@1.0.6
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	serde_spanned@1.1.1
	shlex@2.0.1
	signal-hook-registry@1.4.8
	simd-adler32@0.3.10
	socket2@0.6.5
	strsim@0.11.1
	subtle@2.6.1
	syn@2.0.119
	syn@3.0.3
	tar@0.4.46
	tempfile@3.27.0
	thiserror@2.0.20
	thiserror-impl@2.0.20
	tokio@1.53.1
	tokio-macros@2.7.2
	toml@1.1.6+spec-1.1.0
	toml_datetime@1.1.1+spec-1.1.0
	toml_parser@1.1.3+spec-1.1.0
	toml_writer@1.1.2+spec-1.1.0
	tracing@0.1.44
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	unicode-ident@1.0.24
	untrusted@0.9.0
	ureq@3.4.0
	ureq-proto@0.6.1
	utf8parse@0.2.2
	utf8-zero@0.8.1
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	webpki-roots@1.0.9
	winapi-util@0.1.11
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows-link@0.2.1
	windows-sys@0.52.0
	windows-sys@0.61.2
	windows-targets@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@1.0.4
	xattr@1.6.1
	zeroize@1.9.0
	zip@2.4.2
	zmij@1.0.23
	zopfli@0.8.3
"

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/tinyhumansai/tinybox.git"
# Tagged release; the vendor/tinybus submodule (upstream branch=main) is
# pinned to the commit recorded in the tag.
EGIT_COMMIT="v${PV}"
EGIT_MIN_CLONE_TYPE="shallow"
DESCRIPTION="A tiny containerization service allowing a system to run on different boxes"
HOMEPAGE="https://github.com/tinyhumansai/tinybox"

# All deps are pure Rust or compile their own C (blake3, ring) — no system
# libraries required.
SRC_URI="${CARGO_CRATE_URIS}"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 BSD CDLA-Permissive-2.0 ISC MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

src_unpack() {
	git-r3_src_unpack
	cargo_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_install() {
	dobin "$(cargo_target_dir)/tinybox"
	dodoc README.md LICENSE
}
