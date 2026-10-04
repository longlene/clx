# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash@0.8.12
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	anstyle@1.0.14
	autocfg@1.5.1
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@2.13.1
	borrow-or-share@0.2.4
	bumpalo@3.20.3
	bytecount@0.6.9
	cfg-if@1.0.4
	clap@4.6.2
	clap_builder@4.6.2
	clap_derive@4.6.1
	clap_lex@1.1.0
	data-encoding@2.11.0
	displaydoc@0.2.6
	dyn-clone@1.0.20
	email_address@0.2.9
	equivalent@1.0.2
	fancy-regex@0.18.0
	fluent-uri@0.4.1
	foldhash@0.2.0
	fraction@0.15.4
	getrandom@0.3.4
	hashbrown@0.17.1
	heck@0.5.0
	icu_collections@2.2.0
	icu_locale_core@2.2.0
	icu_normalizer@2.2.0
	icu_normalizer_data@2.2.0
	icu_properties@2.2.0
	icu_properties_data@2.2.0
	icu_provider@2.2.0
	idna@1.1.0
	idna_adapter@1.2.2
	itoa@1.0.18
	js-sys@0.3.103
	jsonschema-regex@0.49.2
	jsonschema-value@0.49.2
	jsonschema@0.49.2
	lazy_static@1.5.0
	libc@0.2.186
	litemap@0.8.2
	lock_api@0.4.14
	memchr@2.8.1
	micromap@0.3.0
	num-bigint@0.4.8
	num-cmp@0.1.0
	num-complex@0.4.6
	num-integer@0.1.46
	num-iter@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	num@0.4.3
	once_cell@1.21.4
	outref@0.5.2
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	percent-encoding@2.3.2
	portable-atomic@1.13.1
	potential_utf@0.1.5
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.45
	r-efi@5.3.0
	redox_syscall@0.5.18
	ref-cast-impl@1.0.25
	ref-cast@1.0.25
	referencing@0.49.2
	regex-automata@0.4.16
	regex-syntax@0.8.11
	regex@1.13.1
	rustversion@1.0.23
	schemars@1.2.1
	schemars_derive@1.2.1
	scopeguard@1.2.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_derive_internals@0.29.1
	serde_json@1.0.150
	smallvec@1.15.2
	stable_deref_trait@1.2.1
	strsim@0.11.1
	strum@0.28.0
	strum_macros@0.28.0
	syn@2.0.117
	synstructure@0.13.2
	target-lexicon@0.13.5
	thiserror-impl@2.0.18
	thiserror@2.0.18
	tinystr@0.8.3
	unicode-general-category@1.1.0
	unicode-ident@1.0.24
	utf8_iter@1.0.4
	uuid-simd@0.8.0
	version_check@0.9.5
	vsimd@0.8.0
	wasip2@1.0.4+wasi-0.2.12
	wasm-bindgen-macro-support@0.2.126
	wasm-bindgen-macro@0.2.126
	wasm-bindgen-shared@0.2.126
	wasm-bindgen@0.2.126
	windows-link@0.2.1
	wit-bindgen@0.57.1
	writeable@0.6.3
	yoke-derive@0.8.2
	yoke@0.8.3
	zerocopy-derive@0.8.55
	zerocopy@0.8.55
	zerofrom-derive@0.1.7
	zerofrom@0.1.8
	zerotrie@0.2.4
	zerovec-derive@0.11.3
	zerovec@0.11.6
	zmij@1.0.21
"

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

inherit cargo distutils-r1

DESCRIPTION="Python SDK and native bindings for NeMo Fabric"
HOMEPAGE="
	https://pypi.org/project/nemo-fabric-runtime/
	https://github.com/NVIDIA/NeMo-Fabric
"
SRC_URI="
	https://github.com/NVIDIA/NeMo-Fabric/archive/refs/tags/v${PV}.tar.gz -> nemo-fabric-runtime-${PV}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
# Python subproject with the [tool.maturin] manifest; the Rust workspace
# root (and its Cargo.lock) sits three levels up in the monorepo.
S="${WORKDIR}"/NeMo-Fabric-${PV}/sdk/python/nemo-fabric-runtime

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0-with-LLVM-exceptions MIT MIT-0 Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.28[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12[${PYTHON_USEDEP}]
"

RESTRICT="test"

# The pyo3 binding crate is a workspace member under crates/, not under S
cargo_src_install() {
	cd "${S}"/../../../crates/fabric-python || die
	cargo_build --path .
}
