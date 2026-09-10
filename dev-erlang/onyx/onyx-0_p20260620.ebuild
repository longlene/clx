# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2@2.0.1
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	anyhow@1.0.102
	anymap3@1.0.1
	autocfg@1.5.0
	bit-set@0.10.0
	bit-vec@0.9.1
	bitflags@2.11.1
	byteorder@1.5.0
	bytes@1.11.1
	cc@1.2.60
	cfg-if@1.0.4
	chacha20@0.10.0
	cpufeatures@0.3.0
	crc32fast@1.5.0
	crunchy@0.2.4
	derive-new@0.7.0
	downcast-rs@2.0.2
	dyn-clone@1.0.20
	dyn-eq@0.1.3
	dyn-hash@1.0.0
	either@1.15.0
	equivalent@1.0.2
	erased-serde@0.4.10
	errno@0.3.14
	filetime@0.2.27
	find-msvc-tools@0.1.9
	flate2@1.1.9
	float-ord@0.3.2
	foldhash@0.1.5
	foldhash@0.2.0
	getrandom@0.4.2
	half@2.4.1
	hashbrown@0.15.5
	hashbrown@0.16.1
	hashbrown@0.17.1
	heck@0.5.0
	id-arena@2.3.0
	indexmap@2.14.0
	inventory@0.3.24
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.18
	lazy_static@1.5.0
	leb128fmt@0.1.0
	libc@0.2.185
	libloading@0.9.0
	libm@0.2.11
	libredox@0.1.16
	linux-raw-sys@0.12.1
	lock_api@0.4.14
	log@0.4.29
	maplit@1.0.2
	matrixmultiply@0.3.10
	memchr@2.8.0
	memmap2@0.9.10
	memo-map@0.3.3
	minijinja@2.20.0
	miniz_oxide@0.8.9
	ndarray@0.17.2
	nom-language@0.1.0
	nom@8.0.0
	num-complex@0.4.6
	num-integer@0.1.46
	num-traits@0.2.19
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	pastey@0.2.3
	plain@0.2.3
	portable-atomic-util@0.2.7
	portable-atomic@1.13.1
	prettyplease@0.2.37
	primal-check@0.3.4
	proc-macro2@1.0.106
	prost-derive@0.14.4
	prost@0.14.4
	quote@1.0.45
	r-efi@6.0.0
	rand@0.10.1
	rand_core@0.10.1
	rand_distr@0.6.0
	rawpointer@0.2.1
	redox_syscall@0.5.18
	redox_syscall@0.7.4
	regex-automata@0.4.14
	regex-lite@0.1.9
	regex-syntax@0.8.10
	regex@1.12.3
	rustfft@6.4.1
	rustix@1.1.4
	rustler@0.37.3
	rustler_codegen@0.37.3
	rustversion@1.0.22
	safetensors@0.7.0
	same-file@1.0.6
	scan_fmt@0.2.6
	scopeguard@1.2.0
	semver@1.0.28
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	shlex@1.3.0
	simd-adler32@0.3.9
	smallvec@1.15.1
	strength_reduce@0.2.4
	string-interner@0.20.0
	syn@2.0.117
	tar@0.4.45
	tract-core@0.23.0
	tract-data@0.23.0
	tract-extra@0.23.0
	tract-hir@0.23.0
	tract-linalg@0.23.0
	tract-nnef@0.23.0
	tract-onnx-opl@0.23.0
	tract-onnx@0.23.0
	tract-pulse-opl@0.23.0
	tract-pulse@0.23.0
	tract-transformers@0.23.0
	transpose@0.2.3
	typeid@1.0.3
	unicode-ident@1.0.24
	unicode-xid@0.2.6
	walkdir@2.5.0
	wasip2@1.0.3+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasmparser@0.244.0
	winapi-util@0.1.11
	windows-link@0.2.1
	windows-sys@0.61.2
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-bindgen@0.57.1
	wit-component@0.244.0
	wit-parser@0.244.0
	xattr@1.6.1
	zmij@1.0.21
"

RUST_MIN_VER="1.91"

inherit cargo rebar3

COMMIT="9e761dee6fcc952a2c5d7659c2cdefa260390375"

DESCRIPTION="ONNX inference NIF for Erlang powered by tract"
HOMEPAGE="https://github.com/roquess/onyx"
SRC_URI="
	https://github.com/roquess/onyx/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/onyx-${COMMIT}"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+="
	ISC MIT MPL-2.0 Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	rebar3_src_prepare
}

src_compile() {
	pushd native/onyx > /dev/null || die
	cargo_env cargo build --release --offline || die "cargo build failed"
	popd > /dev/null || die

	rebar3_src_compile
}

src_install() {
	rebar3_src_install

	# priv/ in _build is a symlink back into ${S}/priv, skipped by
	# rebar3_install_lib; the NIF must be installed manually.
	cp native/onyx/target/release/libonyx.so priv/onyx.so || die
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins priv/onyx.so

	einstalldocs
}
