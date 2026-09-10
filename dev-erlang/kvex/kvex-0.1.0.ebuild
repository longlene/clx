# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	accelerate-src@0.3.2
	adler2@2.0.1
	aho-corasick@1.1.4
	anyhow@1.0.102
	approx@0.5.1
	autocfg@1.5.0
	base64@0.22.1
	base64ct@1.8.3
	bitflags@2.11.1
	blas-src@0.10.0
	block-buffer@0.10.4
	bytemuck@1.25.0
	bytemuck_derive@1.10.2
	byteorder@1.5.0
	bytes@1.11.1
	cblas-sys@0.1.4
	cc@1.2.60
	cfg-if@1.0.4
	coe-rs@0.1.2
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	cpufeatures@0.2.17
	crc32fast@1.5.0
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	crypto-common@0.1.7
	dbgf@0.1.2
	der@0.8.0
	digest@0.10.7
	dirs-sys@0.5.0
	dirs@6.0.0
	dyn-stack-macros@0.1.3
	dyn-stack@0.11.0
	dyn-stack@0.13.2
	either@1.15.0
	enum-as-inner@0.6.1
	equator-macro@0.2.1
	equator-macro@0.4.2
	equator@0.2.2
	equator@0.4.2
	equivalent@1.0.2
	errno@0.3.14
	faer-entity@0.20.1
	faer@0.20.2
	fastrand@2.4.1
	filetime@0.2.27
	find-msvc-tools@0.1.9
	flate2@1.1.9
	foldhash@0.1.5
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	gemm-c32@0.18.2
	gemm-c64@0.18.2
	gemm-common@0.18.2
	gemm-f16@0.18.2
	gemm-f32@0.18.2
	gemm-f64@0.18.2
	gemm@0.18.2
	generativity@1.1.0
	generic-array@0.14.7
	getrandom@0.2.17
	getrandom@0.4.2
	half@2.7.1
	hashbrown@0.15.5
	hashbrown@0.17.0
	heck@0.5.0
	http@1.4.0
	httparse@1.10.1
	id-arena@2.3.0
	indexmap@2.14.0
	itoa@1.0.18
	lazy_static@1.5.0
	leb128fmt@0.1.0
	libc@0.2.185
	libm@0.2.16
	libredox@0.1.16
	linux-raw-sys@0.12.1
	log@0.4.29
	matrixcompare-core@0.1.0
	matrixcompare@0.3.0
	matrixmultiply@0.3.10
	memchr@2.8.0
	miniz_oxide@0.8.9
	nalgebra-macros@0.2.2
	nalgebra@0.32.6
	nano-gemm-c32@0.1.0
	nano-gemm-c64@0.1.0
	nano-gemm-codegen@0.1.0
	nano-gemm-core@0.1.0
	nano-gemm-f32@0.1.0
	nano-gemm-f64@0.1.0
	nano-gemm@0.1.3
	native-tls@0.2.18
	ndarray@0.17.2
	npyz@0.8.4
	num-bigint@0.4.6
	num-complex@0.4.6
	num-integer@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	once_cell@1.21.4
	openblas-build@0.10.15
	openblas-src@0.10.15
	openssl-macros@0.1.1
	openssl-probe@0.2.1
	openssl-sys@0.9.113
	openssl@0.10.77
	option-ext@0.2.0
	ordered-float@4.6.0
	paste@1.0.15
	pem-rfc7468@1.0.0
	percent-encoding@2.3.2
	pest@2.8.6
	pest_derive@2.8.6
	pest_generator@2.8.6
	pest_meta@2.8.6
	pkg-config@0.3.33
	plain@0.2.3
	portable-atomic-util@0.2.7
	portable-atomic@1.13.1
	ppv-lite86@0.2.21
	prettyplease@0.2.37
	proc-macro2@1.0.106
	pulp@0.18.22
	pulp@0.21.5
	py_literal@0.4.0
	quote@1.0.45
	r-efi@6.0.0
	rand@0.8.6
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	raw-cpuid@11.6.0
	rawpointer@0.2.1
	rayon-core@1.13.0
	rayon@1.12.0
	reborrow@0.5.5
	redox_syscall@0.7.4
	redox_users@0.5.2
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	rustix@1.1.4
	rustler@0.32.1
	rustler_codegen@0.32.1
	rustler_sys@2.4.3
	rustls-pki-types@1.14.0
	safe_arch@0.7.4
	same-file@1.0.6
	schannel@0.1.29
	security-framework-sys@2.17.0
	security-framework@3.7.0
	semver@1.0.28
	seq-macro@0.3.6
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	sha2@0.10.9
	shlex@1.3.0
	simba@0.8.1
	simd-adler32@0.3.9
	statrs@0.17.1
	syn@2.0.117
	sysctl@0.6.0
	tar@0.4.45
	tempfile@3.27.0
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	typenum@1.20.0
	ucd-trie@0.1.7
	unicode-ident@1.0.24
	unicode-xid@0.2.6
	unreachable@1.0.0
	ureq-proto@0.6.0
	ureq@3.3.0
	utf8-zero@0.8.1
	vcpkg@0.2.15
	version_check@0.9.5
	void@1.0.2
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.3+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasmparser@0.244.0
	webpki-root-certs@1.0.7
	wide@0.7.33
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
	zerocopy-derive@0.8.48
	zerocopy@0.8.48
	zeroize@1.8.2
	zmij@1.0.21
"

declare -A GIT_CRATES=(
	[turbovec]='https://github.com/RyanCodrai/turbovec;b6786ed2b852b430d0f3b7c8c85a372717d444c7;turbovec-%commit%/turbovec'
)

RUST_MIN_VER="1.91"

inherit cargo rebar3

DESCRIPTION="Approximate k-NN vector search for Erlang/OTP"
HOMEPAGE="https://github.com/roquess/kvex"
SRC_URI="
	https://github.com/roquess/kvex/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+="
	BSD CDLA-Permissive-2.0 MIT MPL-2.0 Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/openssl:="
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc[fortran]"

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	# rebar3_rustler is a dev-only rebar3 plugin (fetched from hex.pm) that
	# drives `cargo build` via a pre_hook; rebar3_src_prepare does not strip
	# plugins/provider_hooks, so it would try (and fail offline) to fetch the
	# plugin. Strip both and build the NIF ourselves in src_compile instead.
	sed -i \
		-e '/{plugins, \[rebar3_rustler\]}\./d' \
		-e '/{provider_hooks,/,/^\]}\./d' \
		rebar.config || die "Failed to strip rebar3_rustler wiring from rebar.config"

	rebar3_src_prepare
}

src_compile() {
	pushd native/kvex_nif > /dev/null || die
	cargo_env cargo build --release --offline || die "cargo build failed"
	popd > /dev/null || die

	rebar3_src_compile
}

src_install() {
	rebar3_src_install

	# priv/ in _build is a symlink back into ${S}/priv, skipped by
	# rebar3_install_lib; the NIF must be installed manually.
	local dest="$(get_erl_libs)/${P}/priv/crates/kvex_nif"
	insinto "${dest}"
	newins native/kvex_nif/target/release/libkvex_nif.so kvex_nif.so

	einstalldocs
}
