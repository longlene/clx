# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	anes@0.1.6
	anstyle@1.0.14
	anyhow@1.0.102
	addr2line@0.25.1
	adler2@2.0.1
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
	cc@1.2.0
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
	dlmalloc@0.2.13
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
	fortanix-sgx-abi@0.6.1
	getopts@0.2.24
	gimli@0.32.3
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
	hashbrown@0.17.1
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
	libc@0.2.185
	moto-rt@0.16.0
	libc@0.2.186
	linux-raw-sys@0.4.15
	log@0.4.29
	memchr@2.7.6
	memchr@2.8.0
	miniz_oxide@0.8.9
	mime@0.3.17
	new_debug_unreachable@1.0.6
	num-traits@0.2.19
	once_cell@1.21.4
	object@0.37.3
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
	r-efi-alloc@2.0.0
	r-efi-alloc@2.1.0
	r-efi@5.2.0
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.9.2
	rand_core@0.9.3
	rand_xorshift@0.4.0
	rustc-literal-escaper@0.0.8
	rayon-core@1.13.0
	rayon@1.12.0
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	roxmltree@0.20.0
	rustc-demangle@0.1.27
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
	shlex@1.3.0
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
	unwinding@0.2.8
	version_check@0.9.5
	vex-sdk@0.27.0
	vex-sdk@0.27.1
	walkdir@2.5.0
	wasip1@1.0.0
	wasip2@1.0.3+wasi-0.2.9
	wasip2@1.0.4+wasi-0.2.12
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasip3@0.6.0+wasi-0.3.0-rc-2026-03-15
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

inherit cargo multiprocessing

DESCRIPTION="Incredibly fast JavaScript runtime, bundler, test runner and package manager"
HOMEPAGE="https://github.com/oven-sh/bun"

# ─── Vendored C/C++ dependency commits (scripts/build/deps/*.ts) ───
# bun's own ninja-orchestrated build fetches these itself over the network at
# build time; we fetch them as normal Gentoo distfiles instead and satisfy
# bun's own fetch-stamp mechanism in src_prepare (see vendor_c_deps below) so
# ninja never touches the network.
PICOHTTPPARSER_COMMIT="066d2b1e9ab820703db0837a7255d92d30f0c9f5"
ZLIB_COMMIT="12731092979c6d07f42da27da673a9f6c7b13586"
ZSTD_COMMIT="f8745da6ff1ad1e7bab384bd1f9d742439278e99"
BROTLI_COMMIT="v1.1.0"
LIBDEFLATE_COMMIT="c8c56a20f8f621e6a966b716b31f1dedab6a41e3"
LIBARCHIVE_COMMIT="ded82291ab41d5e355831b96b0e1ff49e24d8939"
LIBJPEG_TURBO_COMMIT="e352b02f794f701407b39af08576035ba3360d60"
LIBSPNG_COMMIT="fb768002d4288590083a476af628e51c3f1d47cd"
LIBWEBP_COMMIT="b7e29b9d75bd31422b00c2a446d49d7af06c328d"
CARES_COMMIT="c7a3138dcfe3bb0eaaf10c0c24c36dc66dc790ab"
HDRHISTOGRAM_COMMIT="be60a9987ee48d0abf0d7b6a175bad8d6c1585d1"
HIGHWAY_COMMIT="2607d3b5b0113992fe84d3848859eae13b3b52c1"
LIBUV_COMMIT="8023581113b276e7c1aee3f82da57ca0893faab1"
LOLHTML_COMMIT="725ce499aa9b71e38b7a2d0a9fbb6d7294a4079e"
RUST_ARGON2_COMMIT="ed81866f163f0c7026aa6fd8388adf37242eb32a"
LSHPACK_COMMIT="8905c024b6d052f083a3d11d0a169b3c2735c8a1"
LSQPACK_COMMIT="1e9c5b8e59f8161c54f168a570c8bfdc59ded0c3"
MIMALLOC_COMMIT="6a64e1ba7f5b2130d4efccb67ec87fd0003f0f6a"
TINYCC_COMMIT="05f0fafaa3be31e31d7b4b5c17dc60f62c991171"
BORINGSSL_COMMIT="41bf9b59c2ebf277a7aa427e1ecad5cc80dd4d4f"
LSQUIC_COMMIT="3181911301b1aa4f54c1ed690901abc674ee08fb"

# WebKit (JavaScriptCore) prebuilt — scripts/build/deps/webkit.ts
WEBKIT_COMMIT="2e2aa2290fac856d6f451ceacb58f7f5b44dd057"
# Node.js headers (N-API) — scripts/build/deps/nodejs-headers.ts
NODEJS_HEADERS_VERSION="26.3.0"

SRC_URI="
	https://github.com/oven-sh/bun/archive/refs/tags/bun-v${PV}.tar.gz -> ${P}.gh.tar.gz

	https://github.com/h2o/picohttpparser/archive/${PICOHTTPPARSER_COMMIT}.tar.gz -> picohttpparser-${PICOHTTPPARSER_COMMIT}.tar.gz
	https://github.com/zlib-ng/zlib-ng/archive/${ZLIB_COMMIT}.tar.gz -> zlib-ng-${ZLIB_COMMIT}.tar.gz
	https://github.com/facebook/zstd/archive/${ZSTD_COMMIT}.tar.gz -> zstd-${ZSTD_COMMIT}.tar.gz
	https://github.com/google/brotli/archive/${BROTLI_COMMIT}.tar.gz -> brotli-${BROTLI_COMMIT}.tar.gz
	https://github.com/ebiggers/libdeflate/archive/${LIBDEFLATE_COMMIT}.tar.gz -> libdeflate-${LIBDEFLATE_COMMIT}.tar.gz
	https://github.com/libarchive/libarchive/archive/${LIBARCHIVE_COMMIT}.tar.gz -> libarchive-${LIBARCHIVE_COMMIT}.tar.gz
	https://github.com/libjpeg-turbo/libjpeg-turbo/archive/${LIBJPEG_TURBO_COMMIT}.tar.gz -> libjpeg-turbo-${LIBJPEG_TURBO_COMMIT}.tar.gz
	https://github.com/randy408/libspng/archive/${LIBSPNG_COMMIT}.tar.gz -> libspng-${LIBSPNG_COMMIT}.tar.gz
	https://github.com/webmproject/libwebp/archive/${LIBWEBP_COMMIT}.tar.gz -> libwebp-${LIBWEBP_COMMIT}.tar.gz
	https://github.com/c-ares/c-ares/archive/${CARES_COMMIT}.tar.gz -> c-ares-${CARES_COMMIT}.tar.gz
	https://github.com/HdrHistogram/HdrHistogram_c/archive/${HDRHISTOGRAM_COMMIT}.tar.gz -> HdrHistogram_c-${HDRHISTOGRAM_COMMIT}.tar.gz
	https://github.com/google/highway/archive/${HIGHWAY_COMMIT}.tar.gz -> highway-${HIGHWAY_COMMIT}.tar.gz
	https://github.com/oven-sh/libuv/archive/${LIBUV_COMMIT}.tar.gz -> oven-libuv-${LIBUV_COMMIT}.tar.gz
	https://github.com/oven-sh/lol-html/archive/${LOLHTML_COMMIT}.tar.gz -> lol-html-${LOLHTML_COMMIT}.tar.gz
	https://github.com/sru-systems/rust-argon2/archive/${RUST_ARGON2_COMMIT}.tar.gz -> rust-argon2-${RUST_ARGON2_COMMIT}.tar.gz
	https://github.com/litespeedtech/ls-hpack/archive/${LSHPACK_COMMIT}.tar.gz -> ls-hpack-${LSHPACK_COMMIT}.tar.gz
	https://github.com/litespeedtech/ls-qpack/archive/${LSQPACK_COMMIT}.tar.gz -> ls-qpack-${LSQPACK_COMMIT}.tar.gz
	https://github.com/oven-sh/mimalloc/archive/${MIMALLOC_COMMIT}.tar.gz -> oven-mimalloc-${MIMALLOC_COMMIT}.tar.gz
	https://github.com/oven-sh/tinycc/archive/${TINYCC_COMMIT}.tar.gz -> oven-tinycc-${TINYCC_COMMIT}.tar.gz
	https://github.com/oven-sh/boringssl/archive/${BORINGSSL_COMMIT}.tar.gz -> oven-boringssl-${BORINGSSL_COMMIT}.tar.gz
	https://github.com/litespeedtech/lsquic/archive/${LSQUIC_COMMIT}.tar.gz -> lsquic-${LSQUIC_COMMIT}.tar.gz

	amd64? ( https://github.com/oven-sh/WebKit/releases/download/autobuild-${WEBKIT_COMMIT}/bun-webkit-linux-amd64.tar.gz -> bun-webkit-linux-amd64-${WEBKIT_COMMIT}.tar.gz )
	arm64? ( https://github.com/oven-sh/WebKit/releases/download/autobuild-${WEBKIT_COMMIT}/bun-webkit-linux-arm64.tar.gz -> bun-webkit-linux-arm64-${WEBKIT_COMMIT}.tar.gz )
	https://nodejs.org/dist/v${NODEJS_HEADERS_VERSION}/node-v${NODEJS_HEADERS_VERSION}-headers.tar.gz

	${CARGO_CRATE_URIS}

	https://registry.npmjs.org/@lezer/common/-/common-1.5.2.tgz -> npm-lezer-common-1.5.2.tgz.dist
	https://registry.npmjs.org/@lezer/cpp/-/cpp-1.1.6.tgz -> npm-lezer-cpp-1.1.6.tgz.dist
	https://registry.npmjs.org/@lezer/highlight/-/highlight-1.2.3.tgz -> npm-lezer-highlight-1.2.3.tgz.dist
	https://registry.npmjs.org/@lezer/lr/-/lr-1.4.10.tgz -> npm-lezer-lr-1.4.10.tgz.dist
	amd64? ( https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.21.5.tgz -> npm-esbuild-linux-x64-0.21.5.tgz.dist )
	arm64? ( https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.21.5.tgz -> npm-esbuild-linux-arm64-0.21.5.tgz.dist )
	https://registry.npmjs.org/esbuild/-/esbuild-0.21.5.tgz -> npm-esbuild-0.21.5.tgz.dist
	https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz -> npm-js-tokens-4.0.0.tgz.dist
	https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz -> npm-loose-envify-1.4.0.tgz.dist
	https://registry.npmjs.org/react/-/react-18.3.1.tgz -> npm-react-18.3.1.tgz.dist
	https://registry.npmjs.org/react-dom/-/react-dom-18.3.1.tgz -> npm-react-dom-18.3.1.tgz.dist
	https://registry.npmjs.org/scheduler/-/scheduler-0.23.2.tgz -> npm-scheduler-0.23.2.tgz.dist
	https://registry.npmjs.org/source-map-js/-/source-map-js-1.2.1.tgz -> npm-source-map-js-1.2.1.tgz.dist

	https://registry.npmjs.org/preact/-/preact-10.27.2.tgz -> npm-preact-10.27.2.tgz.dist

	https://registry.npmjs.org/abort-controller/-/abort-controller-3.0.0.tgz -> npm-abort-controller-3.0.0.tgz.dist
	https://registry.npmjs.org/asn1.js/-/asn1.js-4.10.1.tgz -> npm-asn1.js-4.10.1.tgz.dist
	https://registry.npmjs.org/assert/-/assert-2.1.0.tgz -> npm-assert-2.1.0.tgz.dist
	https://registry.npmjs.org/available-typed-arrays/-/available-typed-arrays-1.0.7.tgz -> npm-available-typed-arrays-1.0.7.tgz.dist
	https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz -> npm-base64-js-1.5.1.tgz.dist
	https://registry.npmjs.org/bn.js/-/bn.js-5.2.2.tgz -> npm-bn.js-5.2.2.tgz.dist
	https://registry.npmjs.org/bn.js/-/bn.js-4.12.2.tgz -> npm-bn.js-4.12.2.tgz.dist
	https://registry.npmjs.org/brorand/-/brorand-1.1.0.tgz -> npm-brorand-1.1.0.tgz.dist
	https://registry.npmjs.org/browserify-aes/-/browserify-aes-1.2.0.tgz -> npm-browserify-aes-1.2.0.tgz.dist
	https://registry.npmjs.org/browserify-cipher/-/browserify-cipher-1.0.1.tgz -> npm-browserify-cipher-1.0.1.tgz.dist
	https://registry.npmjs.org/browserify-des/-/browserify-des-1.0.2.tgz -> npm-browserify-des-1.0.2.tgz.dist
	https://registry.npmjs.org/browserify-rsa/-/browserify-rsa-4.1.1.tgz -> npm-browserify-rsa-4.1.1.tgz.dist
	https://registry.npmjs.org/browserify-sign/-/browserify-sign-4.2.5.tgz -> npm-browserify-sign-4.2.5.tgz.dist
	https://registry.npmjs.org/browserify-zlib/-/browserify-zlib-0.2.0.tgz -> npm-browserify-zlib-0.2.0.tgz.dist
	https://registry.npmjs.org/buffer/-/buffer-5.0.5.tgz -> npm-buffer-5.0.5.tgz.dist
	https://registry.npmjs.org/buffer/-/buffer-6.0.3.tgz -> npm-buffer-6.0.3.tgz.dist
	https://registry.npmjs.org/buffer-xor/-/buffer-xor-1.0.3.tgz -> npm-buffer-xor-1.0.3.tgz.dist
	https://registry.npmjs.org/builtin-status-codes/-/builtin-status-codes-3.0.0.tgz -> npm-builtin-status-codes-3.0.0.tgz.dist
	https://registry.npmjs.org/call-bind/-/call-bind-1.0.8.tgz -> npm-call-bind-1.0.8.tgz.dist
	https://registry.npmjs.org/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz -> npm-call-bind-apply-helpers-1.0.2.tgz.dist
	https://registry.npmjs.org/call-bound/-/call-bound-1.0.4.tgz -> npm-call-bound-1.0.4.tgz.dist
	https://registry.npmjs.org/cipher-base/-/cipher-base-1.0.7.tgz -> npm-cipher-base-1.0.7.tgz.dist
	https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.3.tgz -> npm-core-util-is-1.0.3.tgz.dist
	https://registry.npmjs.org/create-ecdh/-/create-ecdh-4.0.4.tgz -> npm-create-ecdh-4.0.4.tgz.dist
	https://registry.npmjs.org/create-hash/-/create-hash-1.2.0.tgz -> npm-create-hash-1.2.0.tgz.dist
	https://registry.npmjs.org/create-hmac/-/create-hmac-1.1.7.tgz -> npm-create-hmac-1.1.7.tgz.dist
	https://registry.npmjs.org/crypto-browserify/-/crypto-browserify-3.12.1.tgz -> npm-crypto-browserify-3.12.1.tgz.dist
	https://registry.npmjs.org/define-data-property/-/define-data-property-1.1.4.tgz -> npm-define-data-property-1.1.4.tgz.dist
	https://registry.npmjs.org/define-properties/-/define-properties-1.2.1.tgz -> npm-define-properties-1.2.1.tgz.dist
	https://registry.npmjs.org/des.js/-/des.js-1.1.0.tgz -> npm-des.js-1.1.0.tgz.dist
	https://registry.npmjs.org/diffie-hellman/-/diffie-hellman-5.0.3.tgz -> npm-diffie-hellman-5.0.3.tgz.dist
	https://registry.npmjs.org/domain-browser/-/domain-browser-4.23.0.tgz -> npm-domain-browser-4.23.0.tgz.dist
	https://registry.npmjs.org/dunder-proto/-/dunder-proto-1.0.1.tgz -> npm-dunder-proto-1.0.1.tgz.dist
	https://registry.npmjs.org/elliptic/-/elliptic-6.6.1.tgz -> npm-elliptic-6.6.1.tgz.dist
	https://registry.npmjs.org/es-define-property/-/es-define-property-1.0.1.tgz -> npm-es-define-property-1.0.1.tgz.dist
	https://registry.npmjs.org/es-errors/-/es-errors-1.3.0.tgz -> npm-es-errors-1.3.0.tgz.dist
	https://registry.npmjs.org/es-object-atoms/-/es-object-atoms-1.1.1.tgz -> npm-es-object-atoms-1.1.1.tgz.dist
	https://registry.npmjs.org/event-target-shim/-/event-target-shim-5.0.1.tgz -> npm-event-target-shim-5.0.1.tgz.dist
	https://registry.npmjs.org/events/-/events-3.3.0.tgz -> npm-events-3.3.0.tgz.dist
	https://registry.npmjs.org/evp_bytestokey/-/evp_bytestokey-1.0.3.tgz -> npm-evp_bytestokey-1.0.3.tgz.dist
	https://registry.npmjs.org/for-each/-/for-each-0.3.5.tgz -> npm-for-each-0.3.5.tgz.dist
	https://registry.npmjs.org/function-bind/-/function-bind-1.1.2.tgz -> npm-function-bind-1.1.2.tgz.dist
	https://registry.npmjs.org/generator-function/-/generator-function-2.0.1.tgz -> npm-generator-function-2.0.1.tgz.dist
	https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.3.0.tgz -> npm-get-intrinsic-1.3.0.tgz.dist
	https://registry.npmjs.org/get-proto/-/get-proto-1.0.1.tgz -> npm-get-proto-1.0.1.tgz.dist
	https://registry.npmjs.org/gopd/-/gopd-1.2.0.tgz -> npm-gopd-1.2.0.tgz.dist
	https://registry.npmjs.org/has-property-descriptors/-/has-property-descriptors-1.0.2.tgz -> npm-has-property-descriptors-1.0.2.tgz.dist
	https://registry.npmjs.org/has-symbols/-/has-symbols-1.1.0.tgz -> npm-has-symbols-1.1.0.tgz.dist
	https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.2.tgz -> npm-has-tostringtag-1.0.2.tgz.dist
	https://registry.npmjs.org/hash-base/-/hash-base-3.0.5.tgz -> npm-hash-base-3.0.5.tgz.dist
	https://registry.npmjs.org/hash-base/-/hash-base-3.1.2.tgz -> npm-hash-base-3.1.2.tgz.dist
	https://registry.npmjs.org/hash.js/-/hash.js-1.1.7.tgz -> npm-hash.js-1.1.7.tgz.dist
	https://registry.npmjs.org/hasown/-/hasown-2.0.2.tgz -> npm-hasown-2.0.2.tgz.dist
	https://registry.npmjs.org/hmac-drbg/-/hmac-drbg-1.0.1.tgz -> npm-hmac-drbg-1.0.1.tgz.dist
	https://registry.npmjs.org/https-browserify/-/https-browserify-1.0.0.tgz -> npm-https-browserify-1.0.0.tgz.dist
	https://registry.npmjs.org/ieee754/-/ieee754-1.2.1.tgz -> npm-ieee754-1.2.1.tgz.dist
	https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz -> npm-inherits-2.0.4.tgz.dist
	https://registry.npmjs.org/is-arguments/-/is-arguments-1.2.0.tgz -> npm-is-arguments-1.2.0.tgz.dist
	https://registry.npmjs.org/is-callable/-/is-callable-1.2.7.tgz -> npm-is-callable-1.2.7.tgz.dist
	https://registry.npmjs.org/is-generator-function/-/is-generator-function-1.1.2.tgz -> npm-is-generator-function-1.1.2.tgz.dist
	https://registry.npmjs.org/is-nan/-/is-nan-1.3.2.tgz -> npm-is-nan-1.3.2.tgz.dist
	https://registry.npmjs.org/is-regex/-/is-regex-1.2.1.tgz -> npm-is-regex-1.2.1.tgz.dist
	https://registry.npmjs.org/is-typed-array/-/is-typed-array-1.1.15.tgz -> npm-is-typed-array-1.1.15.tgz.dist
	https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz -> npm-isarray-1.0.0.tgz.dist
	https://registry.npmjs.org/isarray/-/isarray-2.0.5.tgz -> npm-isarray-2.0.5.tgz.dist
	https://registry.npmjs.org/math-intrinsics/-/math-intrinsics-1.1.0.tgz -> npm-math-intrinsics-1.1.0.tgz.dist
	https://registry.npmjs.org/md5.js/-/md5.js-1.3.5.tgz -> npm-md5.js-1.3.5.tgz.dist
	https://registry.npmjs.org/miller-rabin/-/miller-rabin-4.0.1.tgz -> npm-miller-rabin-4.0.1.tgz.dist
	https://registry.npmjs.org/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz -> npm-minimalistic-assert-1.0.1.tgz.dist
	https://registry.npmjs.org/minimalistic-crypto-utils/-/minimalistic-crypto-utils-1.0.1.tgz -> npm-minimalistic-crypto-utils-1.0.1.tgz.dist
	https://registry.npmjs.org/object-is/-/object-is-1.1.6.tgz -> npm-object-is-1.1.6.tgz.dist
	https://registry.npmjs.org/object-keys/-/object-keys-1.1.1.tgz -> npm-object-keys-1.1.1.tgz.dist
	https://registry.npmjs.org/object.assign/-/object.assign-4.1.7.tgz -> npm-object.assign-4.1.7.tgz.dist
	https://registry.npmjs.org/pako/-/pako-1.0.11.tgz -> npm-pako-1.0.11.tgz.dist
	https://registry.npmjs.org/parse-asn1/-/parse-asn1-5.1.9.tgz -> npm-parse-asn1-5.1.9.tgz.dist
	https://registry.npmjs.org/pbkdf2/-/pbkdf2-3.1.5.tgz -> npm-pbkdf2-3.1.5.tgz.dist
	https://registry.npmjs.org/possible-typed-array-names/-/possible-typed-array-names-1.1.0.tgz -> npm-possible-typed-array-names-1.1.0.tgz.dist
	https://registry.npmjs.org/process/-/process-0.11.10.tgz -> npm-process-0.11.10.tgz.dist
	https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.1.tgz -> npm-process-nextick-args-2.0.1.tgz.dist
	https://registry.npmjs.org/public-encrypt/-/public-encrypt-4.0.3.tgz -> npm-public-encrypt-4.0.3.tgz.dist
	https://registry.npmjs.org/punycode/-/punycode-2.3.1.tgz -> npm-punycode-2.3.1.tgz.dist
	https://registry.npmjs.org/querystring-es3/-/querystring-es3-1.0.0-0.tgz -> npm-querystring-es3-1.0.0-0.tgz.dist
	https://registry.npmjs.org/randombytes/-/randombytes-2.1.0.tgz -> npm-randombytes-2.1.0.tgz.dist
	https://registry.npmjs.org/randomfill/-/randomfill-1.0.4.tgz -> npm-randomfill-1.0.4.tgz.dist
	https://registry.npmjs.org/react-refresh/-/react-refresh-0.17.0.tgz -> npm-react-refresh-0.17.0.tgz.dist
	https://registry.npmjs.org/readable-stream/-/readable-stream-4.7.0.tgz -> npm-readable-stream-4.7.0.tgz.dist
	https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.8.tgz -> npm-readable-stream-2.3.8.tgz.dist
	https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.2.tgz -> npm-readable-stream-3.6.2.tgz.dist
	https://registry.npmjs.org/ripemd160/-/ripemd160-2.0.3.tgz -> npm-ripemd160-2.0.3.tgz.dist
	https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz -> npm-safe-buffer-5.2.1.tgz.dist
	https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz -> npm-safe-buffer-5.1.2.tgz.dist
	https://registry.npmjs.org/safe-regex-test/-/safe-regex-test-1.1.0.tgz -> npm-safe-regex-test-1.1.0.tgz.dist
	https://registry.npmjs.org/set-function-length/-/set-function-length-1.2.2.tgz -> npm-set-function-length-1.2.2.tgz.dist
	https://registry.npmjs.org/sha.js/-/sha.js-2.4.12.tgz -> npm-sha.js-2.4.12.tgz.dist
	https://registry.npmjs.org/stream-http/-/stream-http-3.2.0.tgz -> npm-stream-http-3.2.0.tgz.dist
	https://registry.npmjs.org/string_decoder/-/string_decoder-1.3.0.tgz -> npm-string_decoder-1.3.0.tgz.dist
	https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz -> npm-string_decoder-1.1.1.tgz.dist
	https://registry.npmjs.org/to-buffer/-/to-buffer-1.2.2.tgz -> npm-to-buffer-1.2.2.tgz.dist
	https://registry.npmjs.org/typed-array-buffer/-/typed-array-buffer-1.0.3.tgz -> npm-typed-array-buffer-1.0.3.tgz.dist
	https://registry.npmjs.org/util/-/util-0.12.5.tgz -> npm-util-0.12.5.tgz.dist
	https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz -> npm-util-deprecate-1.0.2.tgz.dist
	https://registry.npmjs.org/which-typed-array/-/which-typed-array-1.1.19.tgz -> npm-which-typed-array-1.1.19.tgz.dist
	https://registry.npmjs.org/xtend/-/xtend-4.0.2.tgz -> npm-xtend-4.0.2.tgz.dist
	!system-bootstrap? (
		amd64? ( https://github.com/oven-sh/bun/releases/download/bun-v${PV}/bun-linux-x64.zip -> bun-bin-${PV}-amd64.zip )
		arm64? ( https://github.com/oven-sh/bun/releases/download/bun-v${PV}/bun-linux-aarch64.zip -> bun-bin-${PV}-arm64.zip )
	)
"
S="${WORKDIR}/bun-bun-v${PV}"

LICENSE="Apache-2.0 BSD BSD-2 MIT MPL-2.0 Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# Like dev-lisp/sbcl's system-bootstrap: OFF (default) fetches upstream's
# prebuilt bun of the same version and runs the build scripts with it from
# ${WORKDIR}; ON uses a bun already installed on the system instead.
IUSE="system-bootstrap"

# The workspace requires nightly-only features (allocator_api,
# adt_const_params, generic_const_exprs, ...); allow stable rustc to accept them.
RUSTC_BOOTSTRAP=1

BDEPEND="
	!system-bootstrap? ( app-arch/unzip )
	system-bootstrap? ( || ( dev-lang/bun dev-lang/bun-bin ) )
	dev-build/cmake
	dev-build/ninja
	dev-vcs/git
	llvm-core/clang:21
	llvm-core/lld:21
	>=net-libs/nodejs-25
"
# both install /usr/bin/bun
RDEPEND="!dev-lang/bun-bin"

# ─── C/C++ dep vendoring table: name repo commit "patch1 patch2 ..." ───
# `patches/*` paths are relative to ${S} and already ship in bun's own
# source tree (scripts/build/deps/*.ts just lists them); we apply them
# ourselves and reproduce bun's own fetch-identity stamp (see
# fetch-cli.ts:computeSourceIdentity) so ninja's own configure-time staleness
# check (source.ts:invalidateStaleSource) doesn't wipe our vendored source
# and force a real network re-fetch.
_bun_c_deps() {
	cat <<-EOF
	picohttpparser h2o/picohttpparser ${PICOHTTPPARSER_COMMIT}
	zlib zlib-ng/zlib-ng ${ZLIB_COMMIT} patches/zlib/clang-cl-arm64.patch
	zstd facebook/zstd ${ZSTD_COMMIT}
	brotli google/brotli ${BROTLI_COMMIT}
	libdeflate ebiggers/libdeflate ${LIBDEFLATE_COMMIT}
	libarchive libarchive/libarchive ${LIBARCHIVE_COMMIT} patches/libarchive/archive_write_add_filter_gzip.c.patch,patches/libarchive/select-registered-only.patch,patches/libarchive/nonblocking-read.patch,patches/libarchive/archive_string-codepage-cache.patch
	libjpeg-turbo libjpeg-turbo/libjpeg-turbo ${LIBJPEG_TURBO_COMMIT} patches/libjpeg-turbo/8bit-only.patch,patches/libjpeg-turbo/jbun_stubs.c
	libspng randy408/libspng ${LIBSPNG_COMMIT}
	libwebp webmproject/libwebp ${LIBWEBP_COMMIT}
	cares c-ares/c-ares ${CARES_COMMIT} patches/cares/accept-rdata-compression.patch
	hdrhistogram HdrHistogram/HdrHistogram_c ${HDRHISTOGRAM_COMMIT} patches/hdrhistogram/bitscan-type.patch
	highway google/highway ${HIGHWAY_COMMIT} patches/highway/silence-warnings.patch
	libuv oven-sh/libuv ${LIBUV_COMMIT} patches/libuv/win-poll-rearm-before-callback.patch,patches/libuv/win-poll-abort-with-disconnect.patch
	lolhtml oven-sh/lol-html ${LOLHTML_COMMIT}
	rust-argon2 sru-systems/rust-argon2 ${RUST_ARGON2_COMMIT} patches/rust-argon2/legacy-low-memory.patch
	lshpack litespeedtech/ls-hpack ${LSHPACK_COMMIT} patches/lshpack/bss-huff-tables.patch,patches/lshpack/no-name-trim.patch
	lsqpack litespeedtech/ls-qpack ${LSQPACK_COMMIT} patches/lsqpack/bss-huff-tables.patch
	mimalloc oven-sh/mimalloc ${MIMALLOC_COMMIT}
	tinycc oven-sh/tinycc ${TINYCC_COMMIT} patches/tinycc/tcc.h.patch
	boringssl oven-sh/boringssl ${BORINGSSL_COMMIT}
	lsquic litespeedtech/lsquic ${LSQUIC_COMMIT} patches/lsquic/versions-to-string.patch,patches/lsquic/allow-no-sni.patch,patches/lsquic/skip-priority-walk.patch,patches/lsquic/hash-nested-iter.patch,patches/lsquic/abort-error-tickable.patch,patches/lsquic/disable-gquic.patch,patches/lsquic/requeue-unsent-coalesced.patch,patches/lsquic/node-quic-accessors.patch,patches/lsquic/coalesce-batch-drop.patch,patches/lsquic/connection-close-pns.patch
	EOF
}

# distfile basenames (as fetched, before portage's `-> name` rename) per dep,
# in the same order/keys as _bun_c_deps — used to find the extracted archive
# dir under ${WORKDIR} (unpack() leaves the GH-archive top-level dir named
# <repo-basename>-<commit>).
_bun_archive_dirname() {
	local repo=$1 commit=$2
	# GitHub strips a leading "v" from tag refs (but not commit shas) when
	# naming the archive's top-level directory, e.g. v1.1.0 -> brotli-1.1.0.
	[[ ${commit} =~ ^v[0-9] ]] && commit=${commit#v}
	echo "$(basename "${repo}")-${commit}"
}

vendor_c_deps() {
	local name repo commit patches_csv line
	while read -r name repo commit patches_csv; do
		[[ -z ${name} ]] && continue
		local archdir
		archdir="$(_bun_archive_dirname "${repo}" "${commit}")"
		[[ -d "${WORKDIR}/${archdir}" ]] || die "vendor_c_deps: extracted dir ${archdir} not found for ${name}"

		rm -rf "vendor/${name}" || die
		mkdir -p "vendor/${name}" || die
		cp -a "${WORKDIR}/${archdir}/." "vendor/${name}/" || die

		# Reproduce fetch-cli.ts:computeSourceIdentity — sha256(commit + for
		# each patch: "\0" + patch content with CRLF->LF) truncated to 16 hex
		# chars — while applying each patch (or copying it in, for the one
		# non-.patch overlay file: libjpeg-turbo's jbun_stubs.c).
		local hash_input
		hash_input="$(mktemp)"
		printf '%s' "${commit}" >>"${hash_input}"
		if [[ -n ${patches_csv} ]]; then
			# IFS=',' scoped to this one `read` only (command-prefix form) —
			# `local IFS=','` would leak past this iteration, since `local`
			# only resets on function return, not per-loop-iteration, and
			# corrupt the outer `read` field-splitting for every dep after
			# the first one with patches.
			local patch_arr patch_rel2
			IFS=',' read -ra patch_arr <<<"${patches_csv}"
			for patch_rel2 in "${patch_arr[@]}"; do
				local patch_path2="${S}/${patch_rel2}"
				local normalized
				normalized="$(mktemp)"
				sed 's/\r$//' "${patch_path2}" >"${normalized}"
				printf '\0' >>"${hash_input}"
				cat "${normalized}" >>"${hash_input}"

				local base2
				base2="$(basename "${patch_rel2}")"
				if [[ ${patch_rel2} == *.patch ]]; then
					einfo "vendor_c_deps: ${name}: applying ${base2}"
					# Exactly fetch-cli.ts:applyPatch's own invocation — not
					# eapply, whose -p auto-detection guesses wrong on a
					# handful of these (e.g. tinycc's tcc.h.patch, whose
					# --- tcc.h header has no a/ b/ prefix to strip).
					git -C "vendor/${name}" apply \
						--ignore-whitespace --ignore-space-change --no-index \
						- <"${normalized}" \
						|| die "vendor_c_deps: ${name}: failed to apply ${base2}"
				else
					einfo "vendor_c_deps: ${name}: overlay ${base2}"
					cp "${patch_path2}" "vendor/${name}/${base2}" || die
				fi
				rm -f "${normalized}"
			done
		fi

		local identity
		identity="$(sha256sum "${hash_input}" | cut -c1-16)"
		rm -f "${hash_input}"

		printf '%s\n' "${identity}" > "vendor/${name}/.ref" || die
	done < <(_bun_c_deps)
}

vendor_prebuilt_deps() {
	# WebKit — scripts/build/deps/webkit.ts prebuiltDestDir()/prebuiltUrl()
	# for the "release" profile (no debug/lto/asan suffix on a gnu-abi target).
	local wk_arch wk_url wk_dest
	if use amd64; then
		wk_arch="linux-amd64"
		wk_dest="${WORKDIR}/bun-cache/webkit-${WEBKIT_COMMIT:0:16}"
	else
		wk_arch="linux-arm64"
		wk_dest="${WORKDIR}/bun-cache/webkit-${WEBKIT_COMMIT:0:16}-arm64"
	fi
	local wk_archive="${DISTDIR}/bun-webkit-${wk_arch}-${WEBKIT_COMMIT}.tar.gz"
	[[ -f ${wk_archive} ]] || die "vendor_prebuilt_deps: missing ${wk_archive}"
	rm -rf "${wk_dest}" || die
	mkdir -p "${wk_dest}" || die
	tar -xzf "${wk_archive}" --strip-components=1 -C "${wk_dest}" || die
	printf '%s\n' "${WEBKIT_COMMIT}" > "${wk_dest}/.identity" || die

	# Node.js headers — scripts/build/deps/nodejs-headers.ts
	local nh_dest="${WORKDIR}/bun-cache/nodejs-headers-${NODEJS_HEADERS_VERSION}"
	rm -rf "${nh_dest}" || die
	mkdir -p "${nh_dest}" || die
	tar -xzf "${DISTDIR}/node-v${NODEJS_HEADERS_VERSION}-headers.tar.gz" --strip-components=1 -C "${nh_dest}" || die
	rm -rf "${nh_dest}/include/node/openssl" "${nh_dest}/include/node/uv" "${nh_dest}/include/node/uv.h" || die
	printf '%s\n' "${NODEJS_HEADERS_VERSION}" > "${nh_dest}/.identity" || die
}

# npm placement table: "<tree-relative node_modules path>" "<distfile
# (without the trailing .dist we appended in SRC_URI to dodge portage's
# generic tar auto-unpack, which would collide every npm tarball's shared
# top-level package/ dir into the same WORKDIR path)>"
_bun_npm_root() {
	cat <<-'EOF'
	@lezer/common npm-lezer-common-1.5.2.tgz
	@lezer/cpp npm-lezer-cpp-1.1.6.tgz
	@lezer/highlight npm-lezer-highlight-1.2.3.tgz
	@lezer/lr npm-lezer-lr-1.4.10.tgz
	esbuild npm-esbuild-0.21.5.tgz
	react npm-react-18.3.1.tgz
	react-dom npm-react-dom-18.3.1.tgz
	scheduler npm-scheduler-0.23.2.tgz
	js-tokens npm-js-tokens-4.0.0.tgz
	loose-envify npm-loose-envify-1.4.0.tgz
	source-map-js npm-source-map-js-1.2.1.tgz
	EOF
	if use amd64; then
		echo "@esbuild/linux-x64 npm-esbuild-linux-x64-0.21.5.tgz"
	else
		echo "@esbuild/linux-arm64 npm-esbuild-linux-arm64-0.21.5.tgz"
	fi
}

_bun_npm_bun_error() {
	cat <<-'EOF'
	preact npm-preact-10.27.2.tgz
	EOF
}

_bun_npm_node_fallbacks() {
	cat <<-'EOF'
	abort-controller npm-abort-controller-3.0.0.tgz
	asn1.js npm-asn1.js-4.10.1.tgz
	assert npm-assert-2.1.0.tgz
	available-typed-arrays npm-available-typed-arrays-1.0.7.tgz
	base64-js npm-base64-js-1.5.1.tgz
	bn.js npm-bn.js-5.2.2.tgz
	brorand npm-brorand-1.1.0.tgz
	browserify-aes npm-browserify-aes-1.2.0.tgz
	browserify-cipher npm-browserify-cipher-1.0.1.tgz
	browserify-des npm-browserify-des-1.0.2.tgz
	browserify-rsa npm-browserify-rsa-4.1.1.tgz
	browserify-sign npm-browserify-sign-4.2.5.tgz
	browserify-zlib npm-browserify-zlib-0.2.0.tgz
	buffer npm-buffer-5.0.5.tgz
	buffer-xor npm-buffer-xor-1.0.3.tgz
	builtin-status-codes npm-builtin-status-codes-3.0.0.tgz
	call-bind npm-call-bind-1.0.8.tgz
	call-bind-apply-helpers npm-call-bind-apply-helpers-1.0.2.tgz
	call-bound npm-call-bound-1.0.4.tgz
	cipher-base npm-cipher-base-1.0.7.tgz
	core-util-is npm-core-util-is-1.0.3.tgz
	create-ecdh npm-create-ecdh-4.0.4.tgz
	create-hash npm-create-hash-1.2.0.tgz
	create-hmac npm-create-hmac-1.1.7.tgz
	crypto-browserify npm-crypto-browserify-3.12.1.tgz
	define-data-property npm-define-data-property-1.1.4.tgz
	define-properties npm-define-properties-1.2.1.tgz
	des.js npm-des.js-1.1.0.tgz
	diffie-hellman npm-diffie-hellman-5.0.3.tgz
	domain-browser npm-domain-browser-4.23.0.tgz
	dunder-proto npm-dunder-proto-1.0.1.tgz
	elliptic npm-elliptic-6.6.1.tgz
	es-define-property npm-es-define-property-1.0.1.tgz
	es-errors npm-es-errors-1.3.0.tgz
	es-object-atoms npm-es-object-atoms-1.1.1.tgz
	event-target-shim npm-event-target-shim-5.0.1.tgz
	events npm-events-3.3.0.tgz
	evp_bytestokey npm-evp_bytestokey-1.0.3.tgz
	for-each npm-for-each-0.3.5.tgz
	function-bind npm-function-bind-1.1.2.tgz
	generator-function npm-generator-function-2.0.1.tgz
	get-intrinsic npm-get-intrinsic-1.3.0.tgz
	get-proto npm-get-proto-1.0.1.tgz
	gopd npm-gopd-1.2.0.tgz
	has-property-descriptors npm-has-property-descriptors-1.0.2.tgz
	has-symbols npm-has-symbols-1.1.0.tgz
	has-tostringtag npm-has-tostringtag-1.0.2.tgz
	hash-base npm-hash-base-3.0.5.tgz
	hash.js npm-hash.js-1.1.7.tgz
	hasown npm-hasown-2.0.2.tgz
	hmac-drbg npm-hmac-drbg-1.0.1.tgz
	https-browserify npm-https-browserify-1.0.0.tgz
	ieee754 npm-ieee754-1.2.1.tgz
	inherits npm-inherits-2.0.4.tgz
	is-arguments npm-is-arguments-1.2.0.tgz
	is-callable npm-is-callable-1.2.7.tgz
	is-generator-function npm-is-generator-function-1.1.2.tgz
	is-nan npm-is-nan-1.3.2.tgz
	is-regex npm-is-regex-1.2.1.tgz
	is-typed-array npm-is-typed-array-1.1.15.tgz
	isarray npm-isarray-1.0.0.tgz
	math-intrinsics npm-math-intrinsics-1.1.0.tgz
	md5.js npm-md5.js-1.3.5.tgz
	miller-rabin npm-miller-rabin-4.0.1.tgz
	minimalistic-assert npm-minimalistic-assert-1.0.1.tgz
	minimalistic-crypto-utils npm-minimalistic-crypto-utils-1.0.1.tgz
	object-is npm-object-is-1.1.6.tgz
	object-keys npm-object-keys-1.1.1.tgz
	object.assign npm-object.assign-4.1.7.tgz
	pako npm-pako-1.0.11.tgz
	parse-asn1 npm-parse-asn1-5.1.9.tgz
	pbkdf2 npm-pbkdf2-3.1.5.tgz
	possible-typed-array-names npm-possible-typed-array-names-1.1.0.tgz
	process npm-process-0.11.10.tgz
	process-nextick-args npm-process-nextick-args-2.0.1.tgz
	public-encrypt npm-public-encrypt-4.0.3.tgz
	punycode npm-punycode-2.3.1.tgz
	querystring-es3 npm-querystring-es3-1.0.0-0.tgz
	randombytes npm-randombytes-2.1.0.tgz
	randomfill npm-randomfill-1.0.4.tgz
	react-refresh npm-react-refresh-0.17.0.tgz
	readable-stream npm-readable-stream-4.7.0.tgz
	ripemd160 npm-ripemd160-2.0.3.tgz
	safe-buffer npm-safe-buffer-5.2.1.tgz
	safe-regex-test npm-safe-regex-test-1.1.0.tgz
	set-function-length npm-set-function-length-1.2.2.tgz
	sha.js npm-sha.js-2.4.12.tgz
	stream-http npm-stream-http-3.2.0.tgz
	string_decoder npm-string_decoder-1.3.0.tgz
	to-buffer npm-to-buffer-1.2.2.tgz
	typed-array-buffer npm-typed-array-buffer-1.0.3.tgz
	util npm-util-0.12.5.tgz
	util-deprecate npm-util-deprecate-1.0.2.tgz
	which-typed-array npm-which-typed-array-1.1.19.tgz
	xtend npm-xtend-4.0.2.tgz
	asn1.js/bn.js npm-bn.js-4.12.2.tgz
	create-ecdh/bn.js npm-bn.js-4.12.2.tgz
	diffie-hellman/bn.js npm-bn.js-4.12.2.tgz
	elliptic/bn.js npm-bn.js-4.12.2.tgz
	miller-rabin/bn.js npm-bn.js-4.12.2.tgz
	public-encrypt/bn.js npm-bn.js-4.12.2.tgz
	browserify-sign/readable-stream npm-readable-stream-2.3.8.tgz
	ripemd160/hash-base/readable-stream npm-readable-stream-2.3.8.tgz
	stream-http/readable-stream npm-readable-stream-3.6.2.tgz
	readable-stream/buffer npm-buffer-6.0.3.tgz
	ripemd160/hash-base npm-hash-base-3.1.2.tgz
	to-buffer/isarray npm-isarray-2.0.5.tgz
	browserify-sign/readable-stream/safe-buffer npm-safe-buffer-5.1.2.tgz
	ripemd160/hash-base/readable-stream/safe-buffer npm-safe-buffer-5.1.2.tgz
	browserify-sign/readable-stream/string_decoder npm-string_decoder-1.1.1.tgz
	ripemd160/hash-base/readable-stream/string_decoder npm-string_decoder-1.1.1.tgz
	EOF
}

# Extract a vendored npm tarball's package/ contents into $2 (a
# node_modules/<path> dir, possibly nested for a version-conflicting dep).
_npm_place_one() {
	local dest=$1 distfile=$2
	local archive="${DISTDIR}/${distfile}.dist"
	[[ -f ${archive} ]] || die "_npm_place_one: missing ${archive}"
	mkdir -p "${dest}" || die
	tar -xzf "${archive}" --strip-components=1 -C "${dest}" || die
}

_npm_place_tree() {
	local base=$1 lister=$2
	local relpath distfile
	while read -r relpath distfile; do
		[[ -z ${relpath} ]] && continue
		_npm_place_one "${base}/node_modules/${relpath}" "${distfile}"
	done < <("${lister}")
}

vendor_npm() {
	_npm_place_tree "${S}" _bun_npm_root
	_npm_place_tree "${S}/packages/bun-error" _bun_npm_bun_error
	_npm_place_tree "${S}/src/node-fallbacks" _bun_npm_node_fallbacks

	# bun-types is an in-tree workspace package (bun.lock "overrides":
	# "bun-types": "workspace:packages/bun-types"), not an npm fetch.
	ln -sf ../../packages/bun-types "${S}/node_modules/bun-types" || die

	# esbuild's npm wrapper resolves its platform binary via
	# node_modules/.bin/esbuild -> esbuild/bin/esbuild; scripts/build/tools.ts
	# resolveToolchain() reads the path directly rather than through PATH.
	mkdir -p "${S}/node_modules/.bin" || die
	ln -sf ../esbuild/bin/esbuild "${S}/node_modules/.bin/esbuild" || die
}

# bun's own ninja rule for `bun install --frozen-lockfile` /
# `npm ci` (scripts/build/codegen.ts registerCodegenRules) would otherwise
# try to hit the npm registry at build time. We've already placed
# node_modules ourselves (vendor_npm), so make the rule a pure stamp-touch.
patch_codegen_skip_install() {
	local f="${S}/scripts/build/codegen.ts"
	grep -q 'cd \$dir && \${bun} install --frozen-lockfile && \${touch} \$stamp' "${f}" \
		|| die "patch_codegen_skip_install: bun_install rule command text not found (upstream changed it?)"
	sed -i \
		-e 's|cd \$dir && \${bun} install --frozen-lockfile && \${touch} \$stamp|${touch} $stamp|' \
		"${f}" || die
	# The npm_install rule (packageManager=npm) is never registered — we
	# always build with the default packageManager=bun — so it needs no
	# equivalent patch.
}

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	default

	# The workspace declares two vendored path dependencies (vendor/lolhtml,
	# vendor/rust-argon2) which upstream fetches at build time via
	# scripts/build/deps/lolhtml.ts and rust-argon2.ts, same mechanism as
	# every other entry in vendor_c_deps.
	vendor_c_deps
	vendor_prebuilt_deps
	vendor_npm
	patch_codegen_skip_install

	# Upstream applies this patch to the vendored rust-argon2
	# (scripts/build/deps/rust-argon2.ts) — already handled by vendor_c_deps
	# above via the patches column, kept here only as a sanity marker.
	[[ -f "${S}/vendor/rust-argon2/.ref" ]] || die "rust-argon2 vendoring failed"
}

src_configure() {
	# scripts/build/tools.ts: BUN_TOOLCHAIN_LLVM points resolveLlvmToolchain()
	# at a single bin/ dir instead of searching PATH/known distro layouts
	# (which don't include Gentoo's /usr/lib/llvm/<slot>/bin), and disables
	# its clang version-range check (bun pins LLVM_MAJOR=21 exactly).
	export BUN_TOOLCHAIN_LLVM="/usr/lib/llvm/21"

	# BUN_TOOLCHAIN_RUST points at the sysroot dir containing bin/{rustc,cargo}
	# (scripts/build/tools.ts resolveToolchain()) — derived from whatever
	# rustc eselect currently has active rather than hardcoding a version.
	local rustc_real
	rustc_real="$(readlink -f "$(command -v rustc)")" || die
	export BUN_TOOLCHAIN_RUST="$(dirname "$(dirname "${rustc_real}")")"
}

src_compile() {
	local jobs
	jobs=$(makeopts_jobs)

	# Belt-and-suspenders: make sure this reaches the cargo subprocess that
	# ninja spawns (bare global-scope assignment above may not survive the
	# ebuild-shell -> bun -> ninja -> cargo process chain).
	export RUSTC_BOOTSTRAP=1

	# The GitHub tarball has no .git, so scripts/build/config.ts
	# getGitRevision() falls back to the literal string "unknown" (7 chars),
	# which makes bun_core's const-eval `const_str_slice(SHA, 0, 9)` panic
	# (E0080 mid > len). getGitRevision() honours BUILDKITE_COMMIT /
	# GITHUB_SHA / GIT_SHA env first, so pin the real bun-v${PV} tag commit.
	export GIT_SHA="744846f844374847c902b5e7fd59b4342a51ef99"

	# Resolve the bootstrap `bun` that executes the *.ts build scripts,
	# and put it first in PATH for anything the build spawns by name.
	local bootstrap_bun
	if use system-bootstrap ; then
		bootstrap_bun=$(type -P bun) \
			|| die "system-bootstrap is enabled but no bun found in PATH"
	else
		bootstrap_bun="${WORKDIR}/bun-linux-$(usex amd64 x64 aarch64)/bun"
		chmod +x "${bootstrap_bun}" || die "bootstrap bun not found: ${bootstrap_bun}"
		export PATH="${bootstrap_bun%/*}:${PATH}"
	fi
	einfo "Using bootstrap bun $("${bootstrap_bun}" --version) (${bootstrap_bun})"

	# Drives bun's own configure (writes build.ninja from
	# scripts/build/config.ts) + ninja build, using the bootstrap `bun`
	# as the runtime that executes the *.ts build scripts — matching
	# upstream's own primary `bun run build` workflow, and unifying
	# scripts/build/codegen.ts's "codegen" (jsRuntime) and
	# "codegen_bun" (always bun) ninja rules under the one interpreter.
	"${bootstrap_bun}" scripts/build.ts \
		--profile=release \
		--cache-dir="${WORKDIR}/bun-cache" \
		--build-dir="${WORKDIR}/build" \
		-j"${jobs}" \
		|| die "bun build failed"
}

src_install() {
	local exe
	if [[ -x "${WORKDIR}/build/bun" ]]; then
		exe="${WORKDIR}/build/bun"
	elif [[ -x "${WORKDIR}/build/bun-profile" ]]; then
		exe="${WORKDIR}/build/bun-profile"
	else
		die "src_install: no built bun executable found under ${WORKDIR}/build"
	fi

	dobin "${exe}"
	dosym "$(basename "${exe}")" /usr/bin/bunx
	einstalldocs
}
