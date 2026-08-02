# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2@2.0.1
	aes@0.8.4
	ahash@0.8.12
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.103
	arbitrary@1.4.2
	attribute-derive-macro@0.10.5
	attribute-derive@0.10.5
	autocfg@1.5.1
	base64@0.22.1
	base64ct@1.8.3
	bitflags@1.3.2
	bitflags@2.13.0
	blake2@0.10.6
	block-buffer@0.10.4
	boxcar@0.2.14
	bstr@1.12.3
	bumpalo@3.20.3
	bytes@1.12.0
	bzip2@0.6.1
	castaway@0.2.4
	cc@1.2.65
	cfg-if@1.0.4
	cfg_aliases@0.2.1
	cipher@0.4.4
	clap@4.6.1
	clap_builder@4.6.0
	clap_derive@4.6.1
	clap_lex@1.1.0
	clipboard-win@5.4.1
	collection_literals@1.0.3
	colorchoice@1.0.5
	compact_str@0.9.1
	constant_time_eq@0.3.1
	cpufeatures@0.2.17
	cranelift-assembler-x64-meta@0.133.1
	cranelift-assembler-x64@0.133.1
	cranelift-bforest@0.133.1
	cranelift-bitset@0.133.1
	cranelift-codegen-meta@0.133.1
	cranelift-codegen-shared@0.133.1
	cranelift-codegen@0.133.1
	cranelift-control@0.133.1
	cranelift-entity@0.133.1
	cranelift-frontend@0.133.1
	cranelift-isle@0.133.1
	cranelift-jit@0.133.1
	cranelift-module@0.133.1
	cranelift-native@0.133.1
	cranelift-object@0.133.1
	cranelift-srcgen@0.133.1
	crc-catalog@2.5.0
	crc32fast@1.5.0
	crc@3.4.0
	crypto-common@0.1.7
	deflate64@0.1.12
	deranged@0.5.8
	derive-where@1.6.1
	derive_arbitrary@1.4.2
	digest@0.10.7
	displaydoc@0.2.6
	either@1.16.0
	endian-type@0.2.0
	equivalent@1.0.2
	errno@0.3.14
	error-code@3.3.2
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	filetime@0.2.29
	find-msvc-tools@0.1.9
	flate2@1.1.9
	fnv@1.0.7
	foldhash@0.2.0
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.2
	generator@0.8.9
	generic-array@0.14.7
	get-size-derive2@0.7.4
	get-size2@0.7.4
	getopts@0.2.24
	getrandom@0.2.17
	getrandom@0.3.4
	gimli@0.33.0
	hashbrown@0.14.5
	hashbrown@0.16.1
	hashbrown@0.17.1
	hashlink@0.9.1
	heck@0.5.0
	hmac@0.12.1
	home@0.5.12
	http@1.4.2
	httparse@1.10.1
	icu_collections@2.2.0
	icu_locale_core@2.2.0
	icu_normalizer@2.2.0
	icu_normalizer_data@2.2.0
	icu_properties@2.2.0
	icu_properties_data@2.2.0
	icu_provider@2.2.0
	idna@1.1.0
	idna_adapter@1.2.2
	indexmap@2.14.0
	inout@0.1.4
	interpolator@0.5.0
	is-macro@0.3.7
	is_terminal_polyfill@1.70.2
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.18
	jobserver@0.1.34
	keccak@0.1.6
	lazy_static@1.5.0
	libbz2-rs-sys@0.2.5
	libc@0.2.186
	libm@0.2.16
	libsqlite3-sys@0.30.1
	linux-raw-sys@0.12.1
	litemap@0.8.2
	log@0.4.33
	loom@0.7.2
	lzma-rust2@0.13.0
	lzma-sys@0.1.20
	mach2@0.4.3
	manyhow-macros@0.11.4
	manyhow@0.11.4
	matchers@0.2.0
	md-5@0.10.6
	memchr@2.8.2
	memmap2@0.2.3
	miniz_oxide@0.8.9
	nibble_vec@0.1.0
	nix@0.31.3
	nu-ansi-term@0.50.3
	num-bigint@0.4.6
	num-conv@0.2.2
	num-integer@0.1.46
	num-traits@0.2.19
	object@0.39.1
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	openssl-macros@0.1.1
	openssl-src@300.6.1+3.6.3
	openssl-sys@0.9.117
	openssl@0.10.81
	password-hash@0.5.0
	pbkdf2@0.12.2
	pep440_rs@0.7.3
	pep508_rs@0.9.2
	percent-encoding@2.3.2
	phf@0.11.3
	phf_codegen@0.11.3
	phf_generator@0.11.3
	phf_shared@0.11.3
	pin-project-lite@0.2.17
	pkg-config@0.3.33
	potential_utf@0.1.5
	powerfmt@0.2.0
	ppmd-rust@1.4.0
	ppv-lite86@0.2.21
	priority-queue@2.7.0
	proc-macro-utils@0.10.0
	proc-macro2@1.0.106
	pubgrub@0.4.0
	quote-use-macros@0.8.4
	quote-use@0.8.4
	quote@1.0.46
	r-efi@5.3.0
	radix_trie@0.3.0
	rand@0.8.6
	rand_chacha@0.3.1
	rand_core@0.6.4
	regalloc2@0.15.1
	regex-automata@0.4.14
	regex-syntax@0.8.11
	regex@1.12.4
	region@3.0.2
	ring@0.17.14
	rusqlite@0.32.1
	rustc-hash@2.1.2
	rustix@1.1.4
	rustls-pki-types@1.15.0
	rustls-webpki@0.103.13
	rustls@0.23.41
	rustversion@1.0.22
	rustyline@18.0.1
	ryu@1.0.23
	salsa20@0.10.2
	scoped-tls@1.0.1
	scrypt@0.11.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	serde_spanned@1.1.1
	sha1@0.10.6
	sha2@0.10.9
	sha3@0.10.9
	sharded-slab@0.1.7
	shlex@2.0.1
	simd-adler32@0.3.9
	siphasher@1.0.3
	smallvec@1.15.2
	stable_deref_trait@1.2.1
	static_assertions@1.1.0
	strsim@0.11.1
	subtle@2.6.1
	syn@2.0.118
	synstructure@0.13.2
	tar@0.4.46
	target-lexicon@0.13.5
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	thread_local@1.1.9
	time-core@0.1.9
	time@0.3.53
	tinystr@0.8.3
	tinyvec@1.11.0
	tinyvec_macros@0.1.1
	toml_datetime@0.7.5+spec-1.1.0
	toml_edit@0.23.10+spec-1.0.0
	toml_parser@1.1.2+spec-1.1.0
	toml_writer@1.1.1+spec-1.1.0
	tracing-core@0.1.36
	tracing-log@0.2.0
	tracing-subscriber@0.3.23
	tracing@0.1.44
	typenum@1.20.1
	unicode-ident@1.0.24
	unicode-normalization@0.1.25
	unicode-segmentation@1.13.3
	unicode-width@0.2.2
	unicode_names2@1.3.0
	unicode_names2_generator@1.3.0
	unscanny@0.1.0
	untrusted@0.9.0
	ureq-proto@0.6.0
	ureq@3.3.0
	url@2.5.8
	urlencoding@2.1.3
	utf8-zero@0.8.1
	utf8_iter@1.0.4
	utf8parse@0.2.2
	valuable@0.1.1
	vcpkg@0.2.15
	version-ranges@0.1.3
	version_check@0.9.5
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.4+wasi-0.2.12
	wasmtime-internal-core@46.0.1
	wasmtime-internal-jit-icache-coherence@46.0.1
	webpki-roots@1.0.8
	windows-link@0.2.1
	windows-result@0.4.1
	windows-sys@0.52.0
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
	winnow@0.7.15
	winnow@1.0.3
	wit-bindgen@0.57.1
	writeable@0.6.3
	xattr@1.6.1
	xz2@0.1.7
	yoke-derive@0.8.2
	yoke@0.8.3
	zerocopy-derive@0.8.52
	zerocopy@0.8.52
	zerofrom-derive@0.1.7
	zerofrom@0.1.8
	zeroize@1.9.0
	zeroize_derive@1.5.0
	zerotrie@0.2.4
	zerovec-derive@0.11.3
	zerovec@0.11.6
	zip@6.0.0
	zlib-rs@0.6.5
	zmij@1.0.21
	zopfli@0.8.3
	zstd-safe@7.2.4
	zstd-sys@2.0.16+zstd.1.5.7
	zstd@0.13.3
"

declare -A GIT_CRATES=(
	[ruff_python_ast]='https://github.com/astral-sh/ruff;beea8cdfec826802a7d9ecada3b38156eb693e77;ruff-%commit%/crates/ruff_python_ast'
	[ruff_python_parser]='https://github.com/astral-sh/ruff;beea8cdfec826802a7d9ecada3b38156eb693e77;ruff-%commit%/crates/ruff_python_parser'
	[ruff_python_trivia]='https://github.com/astral-sh/ruff;beea8cdfec826802a7d9ecada3b38156eb693e77;ruff-%commit%/crates/ruff_python_trivia'
	[ruff_source_file]='https://github.com/astral-sh/ruff;beea8cdfec826802a7d9ecada3b38156eb693e77;ruff-%commit%/crates/ruff_source_file'
	[ruff_text_size]='https://github.com/astral-sh/ruff;beea8cdfec826802a7d9ecada3b38156eb693e77;ruff-%commit%/crates/ruff_text_size'
)

RUST_MIN_VER="1.94.0"

inherit cargo

COMMIT="a0863266bb767bc0d05ed33804872eb02ac29a48"

DESCRIPTION="JIT and AoT native compiler and runtime for Python 3.14, written in Rust"
HOMEPAGE="https://github.com/can1357/pon"
SRC_URI="
	https://github.com/can1357/pon/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/pon-${COMMIT}"

# Upstream ships no license file: all-rights-reserved, no redistribution
LICENSE="all-rights-reserved"
# Crate licenses (statically linked)
LICENSE+=" Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0
	CDLA-Permissive-2.0 ISC MIT MPL-2.0 Unicode-3.0 Unicode-DFS-2016 ZLIB
	BZIP2 || ( CC0-1.0 MIT-0 )"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

# pon-runtime calls noraw() which lives in libtinfow on Gentoo's split ncurses
DEPEND="sys-libs/ncurses:=[unicode(+)]"
RDEPEND="${DEPEND}"
# openssl-src (vendored openssl) needs perl to build
BDEPEND="dev-lang/perl"

QA_FLAGS_IGNORED="usr/bin/pon"

src_prepare() {
	# glibc splits ncurses: noraw() lives in libtinfow, not libncursesw.
	# Inject a build.rs for pon-runtime that adds the explicit link flag.
	cat > pon-runtime/build.rs <<'BUILDRS'
fn main() {
	if std::env::var("CARGO_CFG_TARGET_OS").as_deref() != Ok("macos") {
		println!("cargo:rustc-link-lib=tinfow");
	}
}
BUILDRS
	default
}

src_compile() {
	cargo_src_compile --package pon
}

src_install() {
	cargo_src_install --path ./pon
	dodoc README.md
}
