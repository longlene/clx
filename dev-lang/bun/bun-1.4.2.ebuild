# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	anes@0.1.6
	anstyle@1.0.14
	anyhow@1.0.102
	arrayref@0.3.9
	arrayvec@0.7.6
	autocfg@1.5.0
	base64@0.22.1
	bcrypt@0.19.0
	bitflags@2.11.1
	blake2@0.10.6
	blake2b_simd@1.0.4
	block-buffer@0.10.4
	blowfish@0.9.1
	bstr@1.12.1
	bumpalo@3.20.2
	bytemuck@1.25.0
	byteorder@1.5.0
	cast@0.3.0
	cfg-if@1.0.4
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	cipher@0.4.4
	clap@4.6.1
	clap_builder@4.6.0
	clap_lex@1.1.0
	const_format@0.2.36
	const_format_proc_macros@0.2.34
	constant_time_eq@0.4.2
	cpufeatures@0.2.17
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	crypto-common@0.1.7
	cssparser-macros@0.6.1
	cssparser@0.36.0
	darling@0.21.3
	darling_core@0.21.3
	darling_macro@0.21.3
	derive_more-impl@2.1.1
	derive_more@2.1.1
	digest@0.10.7
	dtoa-short@0.3.5
	dtoa@1.0.11
	either@1.15.0
	encoding_rs@0.8.35
	enum-map-derive@0.17.0
	enum-map@2.7.3
	enumset@1.1.10
	enumset_derive@0.14.0
	equivalent@1.0.2
	errno@0.3.14
	fastrand@2.4.1
	fnv@1.0.7
	foldhash@0.1.5
	foldhash@0.2.0
	futures-core@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	generic-array@0.14.7
	getrandom@0.4.2
	half@2.7.1
	hashbrown@0.15.5
	hashbrown@0.16.1
	hashbrown@0.17.0
	heck@0.5.0
	hermit-abi@0.5.2
	id-arena@2.3.0
	ident_case@1.0.1
	indexmap@2.14.0
	inout@0.1.4
	is-terminal@0.4.17
	itertools@0.10.5
	itoa@1.0.18
	js-sys@0.3.98
	keccak@0.1.6
	konst@0.2.20
	konst_macro_rules@0.2.19
	leb128fmt@0.1.0
	libc@0.2.186
	linux-raw-sys@0.4.15
	log@0.4.29
	memchr@2.8.0
	mime@0.3.17
	new_debug_unreachable@1.0.6
	num-traits@0.2.19
	once_cell@1.21.4
	oorandom@11.1.5
	paste@1.0.15
	phf@0.13.1
	phf_codegen@0.13.1
	phf_generator@0.13.1
	phf_macros@0.13.1
	phf_shared@0.13.1
	pin-project-lite@0.2.17
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	precomputed-hash@0.1.1
	prettyplease@0.2.37
	proc-macro2@1.0.106
	quick-xml@0.38.4
	quote@1.0.45
	r-efi@6.0.0
	rayon-core@1.13.0
	rayon@1.12.0
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	roxmltree@0.20.0
	rustc-hash@2.1.2
	rustc_version@0.4.1
	rustix@0.38.44
	rustversion@1.0.22
	same-file@1.0.6
	scopeguard@1.2.0
	selectors@0.33.0
	semver@1.0.28
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	servo_arc@0.4.3
	sha3@0.10.9
	siphasher@1.0.3
	slab@0.4.12
	smallvec@1.15.1
	stable_deref_trait@1.2.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	syn@2.0.117
	thiserror-impl@2.0.18
	thiserror@2.0.18
	tinytemplate@1.2.1
	typed-arena@2.0.2
	typenum@1.20.0
	unicode-ident@1.0.24
	unicode-xid@0.2.6
	version_check@0.9.5
	walkdir@2.5.0
	wasip2@1.0.3+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-bindgen-macro-support@0.2.121
	wasm-bindgen-macro@0.2.121
	wasm-bindgen-shared@0.2.121
	wasm-bindgen@0.2.121
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasmparser@0.244.0
	web-sys@0.3.98
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
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-bindgen@0.57.1
	wit-component@0.244.0
	wit-parser@0.244.0
	xml-rs@0.8.29
	zerocopy-derive@0.8.48
	zerocopy@0.8.48
	zeroize@1.8.2
	zmij@1.0.21
"

inherit cargo

DESCRIPTION="Incredibly fast JavaScript runtime, bundler, test runner and package manager"
HOMEPAGE="https://github.com/oven-sh/bun"

LOLHTML_COMMIT="725ce499aa9b71e38b7a2d0a9fbb6d7294a4079e"
RUST_ARGON2_COMMIT="ed81866f163f0c7026aa6fd8388adf37242eb32a"

SRC_URI="
	https://github.com/oven-sh/bun/archive/refs/tags/bun-v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/oven-sh/lol-html/archive/${LOLHTML_COMMIT}.tar.gz
	https://github.com/sru-systems/rust-argon2/archive/${RUST_ARGON2_COMMIT}.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/bun-bun-v${PV}"

LICENSE="Apache-2.0 BSD BSD-2 MIT MPL-2.0 Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64"

# The workspace requires nightly-only features (allocator_api,
# adt_const_params, generic_const_exprs, ...); allow stable rustc to accept them.
RUSTC_BOOTSTRAP=1

BDEPEND=""
DEPEND=""
RDEPEND=""

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	default

	# The workspace declares two vendored path dependencies (vendor/lolhtml,
	# vendor/rust-argon2) which upstream fetches at build time via
	# scripts/build/deps/lolhtml.ts and rust-argon2.ts. The GitHub tarball
	# excludes vendor/ (see `exclude` in Cargo.toml), so we fetch the pinned
	# commits in SRC_URI; portage unpacks them into ${WORKDIR}.
	mkdir -p vendor || die
	mv "${WORKDIR}/lol-html-${LOLHTML_COMMIT}" vendor/lolhtml || die
	mv "${WORKDIR}/rust-argon2-${RUST_ARGON2_COMMIT}" vendor/rust-argon2 || die

	# Upstream applies this patch to the vendored rust-argon2
	# (scripts/build/deps/rust-argon2.ts).
	cd "${S}/vendor/rust-argon2" || die
	eapply -p1 "${S}/patches/rust-argon2/legacy-low-memory.patch" || die
	cd "${S}" || die

	# Codegen outputs land here; rustc reads BUN_CODEGEN_DIR via env!().
	mkdir -p "${WORKDIR}/codegen" || die
	export BUN_CODEGEN_DIR="${WORKDIR}/codegen"
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install -p bun_runtime
}
