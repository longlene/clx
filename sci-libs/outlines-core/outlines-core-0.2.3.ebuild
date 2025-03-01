# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	adler2@2.0.0
	aho-corasick@1.1.3
	autocfg@1.4.0
	base64@0.13.1
	base64@0.22.1
	bincode@2.0.0-rc.3
	bincode_derive@2.0.0-rc.3
	bitflags@1.3.2
	bitflags@2.8.0
	bumpalo@3.17.0
	byteorder@1.5.0
	cc@1.2.15
	cfg-if@1.0.0
	console@0.15.10
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	crc32fast@1.4.2
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	dirs-sys@0.4.1
	dirs@5.0.1
	displaydoc@0.2.5
	either@1.14.0
	encode_unicode@1.0.0
	equivalent@1.0.2
	errno@0.3.10
	esaxx-rs@0.1.10
	fastrand@2.3.0
	flate2@1.1.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	getrandom@0.2.15
	getrandom@0.3.1
	hashbrown@0.15.2
	heck@0.5.0
	hf-hub@0.3.2
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
	ident_case@1.0.1
	idna@1.0.3
	idna_adapter@1.2.0
	indexmap@2.7.1
	indicatif@0.17.11
	indoc@2.0.5
	itertools@0.11.0
	itertools@0.12.1
	itoa@1.0.14
	js-sys@0.3.77
	lazy_static@1.5.0
	libc@0.2.170
	libredox@0.1.3
	linux-raw-sys@0.4.15
	litemap@0.7.4
	log@0.4.26
	macro_rules_attribute-proc_macro@0.2.0
	macro_rules_attribute@0.2.0
	memchr@2.7.4
	memoffset@0.9.1
	minimal-lexical@0.2.1
	miniz_oxide@0.8.5
	monostate-impl@0.1.13
	monostate@0.1.13
	native-tls@0.2.14
	nom@7.1.3
	number_prefix@0.4.0
	once_cell@1.20.3
	onig@6.4.0
	onig_sys@69.8.1
	openssl-macros@0.1.1
	openssl-probe@0.1.6
	openssl-sys@0.9.106
	openssl@0.10.71
	option-ext@0.2.0
	paste@1.0.15
	percent-encoding@2.3.1
	pkg-config@0.3.31
	portable-atomic@1.11.0
	ppv-lite86@0.2.20
	proc-macro2@1.0.93
	pyo3-build-config@0.22.6
	pyo3-ffi@0.22.6
	pyo3-macros-backend@0.22.6
	pyo3-macros@0.22.6
	pyo3@0.22.6
	quote@1.0.38
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon-cond@0.3.0
	rayon-core@1.12.1
	rayon@1.10.0
	redox_users@0.4.6
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	ring@0.17.11
	rustc-hash@2.1.1
	rustix@0.38.44
	rustls-pki-types@1.11.0
	rustls-webpki@0.102.8
	rustls@0.23.23
	ryu@1.0.19
	schannel@0.1.27
	security-framework-sys@2.14.0
	security-framework@2.11.1
	serde-pyobject@0.4.0
	serde@1.0.218
	serde_derive@1.0.218
	serde_json@1.0.139
	shlex@1.3.0
	smallvec@1.14.0
	spm_precompiled@0.1.4
	stable_deref_trait@1.2.0
	strsim@0.11.1
	subtle@2.6.1
	syn@2.0.98
	synstructure@0.13.1
	target-lexicon@0.12.16
	tempfile@3.17.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	tinystr@0.7.6
	tokenizers@0.20.3
	unicode-ident@1.0.17
	unicode-normalization-alignments@0.1.12
	unicode-segmentation@1.12.0
	unicode-width@0.2.0
	unicode_categories@0.1.1
	unindent@0.2.3
	untrusted@0.9.0
	ureq@2.12.1
	url@2.5.4
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	vcpkg@0.2.15
	virtue@0.0.13
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	web-time@1.1.0
	webpki-roots@0.26.8
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	wit-bindgen-rt@0.33.0
	write16@1.0.0
	writeable@0.5.5
	yoke-derive@0.7.5
	yoke@0.7.5
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zerofrom-derive@0.1.5
	zerofrom@0.1.5
	zeroize@1.8.1
	zerovec-derive@0.10.3
	zerovec@0.10.4
"

inherit distutils-r1 cargo

DESCRIPTION="Structured Text Generation in Rust"
HOMEPAGE="
	https://github.com/dottxt-ai/outlines-core
"
SRC_URI="
	https://github.com/dottxt-ai/outlines-core/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/jsonschema[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-rust[${PYTHON_USEDEP}]
	')
"
#	test? (
#	)

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_OUTLINES_CORE="${PV}"

pkg_setup() {
	rust_pkg_setup
	python-single-r1_pkg_setup
}

src_unpack() {
	cargo_src_unpack
}

src_configure() {
	cargo_src_configure
	distutils-r1_src_configure
}

src_compile() {
	cargo_src_compile
	distutils-r1_src_compile
}

src_install() {
	cargo_src_install
	distutils-r1_src_install
}
