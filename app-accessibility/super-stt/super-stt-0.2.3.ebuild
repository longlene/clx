# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.26.1
	adler2@2.0.1
	ahash@0.8.12
	aho-corasick@1.1.4
	allocator-api2@0.2.21
	alsa-sys@0.4.0
	alsa@0.11.0
	ambient-authority@0.0.2
	android_system_properties@0.1.5
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.102
	arbitrary@1.4.2
	assert-json-diff@2.0.2
	async-broadcast@0.7.2
	async-channel@2.5.0
	async-executor@1.14.0
	async-io@2.6.0
	async-lock@3.4.2
	async-process@2.5.0
	async-recursion@1.1.1
	async-signal@0.2.13
	async-stream-impl@0.3.6
	async-stream@0.3.6
	async-task@4.7.1
	async-trait@0.1.92
	atomic-waker@1.1.2
	audio-core@0.2.1
	audioadapter-buffers@3.0.0
	audioadapter-sample@3.0.0
	audioadapter@3.0.0
	autocfg@1.5.0
	axum-core@0.5.6
	axum@0.8.9
	base64@0.22.1
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@2.11.0
	block-buffer@0.10.4
	block2@0.6.2
	blocking@1.6.2
	borrow-or-share@0.2.4
	bumpalo@3.20.2
	bytecount@0.6.9
	bytemuck@1.25.0
	bytemuck_derive@1.10.2
	bytes@1.12.1
	cap-fs-ext@3.4.5
	cap-net-ext@3.4.5
	cap-primitives@3.4.5
	cap-std@3.4.5
	cap-time-ext@3.4.5
	cc@1.2.57
	cesu8@1.1.0
	cfg-if@1.0.4
	chacha20@0.10.0
	chrono@0.4.44
	clap@4.6.6
	clap_builder@4.6.6
	clap_derive@4.6.4
	clap_lex@1.1.0
	cobs@0.3.0
	colorchoice@1.0.5
	colored@3.1.1
	combine@4.6.7
	concurrent-queue@2.5.0
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	core-graphics-types@0.2.0
	core-graphics@0.25.0
	coreaudio-rs@0.14.0
	cpal@0.17.3
	cpp_demangle@0.4.5
	cpufeatures@0.2.17
	cpufeatures@0.3.0
	cranelift-assembler-x64-meta@0.132.3
	cranelift-assembler-x64@0.132.3
	cranelift-bforest@0.132.2
	cranelift-bitset@0.132.2
	cranelift-codegen-meta@0.132.2
	cranelift-codegen-shared@0.132.3
	cranelift-codegen@0.132.2
	cranelift-control@0.132.3
	cranelift-entity@0.132.2
	cranelift-frontend@0.132.2
	cranelift-isle@0.132.2
	cranelift-native@0.132.2
	cranelift-srcgen@0.132.3
	crc32fast@1.5.0
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crypto-common@0.1.7
	darling@0.20.11
	darling_core@0.20.11
	darling_macro@0.20.11
	dashmap@6.2.1
	dasp_sample@0.11.0
	data-encoding@2.11.0
	dbus-secret-service@4.1.0
	dbus@0.9.10
	deadpool-runtime@0.1.4
	deadpool@0.12.3
	debugid@0.8.0
	digest@0.10.7
	directories-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.5.0
	dirs@6.0.0
	dispatch2@0.3.1
	displaydoc@0.2.5
	dlib@0.5.3
	downcast-rs@1.2.1
	either@1.15.0
	email_address@0.2.9
	embedded-io@0.4.0
	embedded-io@0.6.1
	encoding_rs@0.8.35
	endi@1.1.1
	enumflags2@0.7.12
	enumflags2_derive@0.7.12
	env_filter@2.0.0
	env_logger@0.11.11
	equivalent@1.0.2
	errno@0.3.14
	event-listener-strategy@0.5.4
	event-listener@5.4.1
	fancy-regex@0.18.0
	fastrand@2.3.0
	filetime@0.2.29
	find-msvc-tools@0.1.9
	fixedbitset@0.4.2
	flate2@1.1.9
	float-cmp@0.10.0
	fluent-uri@0.4.1
	fnv@1.0.7
	foldhash@0.1.5
	foldhash@0.2.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	form_urlencoded@1.2.2
	fraction@0.15.4
	fs-set-times@0.20.3
	futures-channel@0.3.33
	futures-core@0.3.33
	futures-executor@0.3.33
	futures-io@0.3.33
	futures-lite@2.6.1
	futures-macro@0.3.33
	futures-sink@0.3.33
	futures-task@0.3.33
	futures-util@0.3.33
	futures@0.3.33
	fxprof-processed-profile@0.8.1
	generic-array@0.14.7
	getrandom@0.2.17
	getrandom@0.3.4
	getrandom@0.4.2
	gimli@0.33.0
	gpu-probe@0.1.1
	h2@0.4.15
	hashbrown@0.14.5
	hashbrown@0.15.5
	hashbrown@0.16.1
	hashbrown@0.17.1
	heck@0.5.0
	hermit-abi@0.5.2
	hex@0.4.3
	hound@3.5.1
	http-body-util@0.1.3
	http-body@1.0.1
	http@1.4.0
	httparse@1.10.1
	httpdate@1.0.3
	hyper-rustls@0.27.7
	hyper-util@0.1.20
	hyper@1.11.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	icu_collections@2.1.1
	icu_locale_core@2.1.1
	icu_normalizer@2.1.1
	icu_normalizer_data@2.1.1
	icu_properties@2.1.2
	icu_properties_data@2.1.2
	icu_provider@2.1.1
	id-arena@2.3.0
	ident_case@1.0.1
	idna@1.1.0
	idna_adapter@1.2.1
	indexmap@2.14.0
	io-extras@0.18.4
	io-lifetimes@2.0.4
	ipnet@2.12.0
	iri-string@0.7.11
	is_terminal_polyfill@1.70.2
	itertools@0.14.0
	itoa@1.0.18
	ittapi-sys@0.4.0
	ittapi@0.4.0
	jiff-static@0.2.23
	jiff-tzdb-platform@0.1.3
	jiff-tzdb@0.1.6
	jiff@0.2.23
	jni-sys-macros@0.4.1
	jni-sys@0.3.1
	jni-sys@0.4.1
	jni@0.21.1
	jobserver@0.1.34
	js-sys@0.3.91
	jsonschema@0.46.5
	keyring@3.6.3
	lazy_static@1.5.0
	leb128@0.2.6
	leb128fmt@0.1.0
	libc@0.2.186
	libdbus-sys@0.2.7
	libloading@0.8.9
	libm@0.2.16
	libredox@0.1.18
	linux-raw-sys@0.12.1
	litemap@0.8.1
	lock_api@0.4.14
	log@0.4.33
	mach2@0.4.3
	mach2@0.5.0
	matchit@0.8.4
	maybe-owned@0.3.4
	memchr@2.8.0
	memfd@0.6.5
	memmap2@0.9.10
	memoffset@0.9.1
	microfft@0.6.0
	micromap@0.3.0
	mime@0.3.17
	mime_guess@2.0.5
	miniz_oxide@0.8.9
	mio@1.2.0
	mockito@1.7.2
	ndk-context@0.1.1
	ndk-sys@0.6.0+11769913
	ndk@0.9.0
	nom@8.0.0
	num-bigint@0.4.6
	num-cmp@0.1.0
	num-complex@0.4.6
	num-derive@0.4.2
	num-integer@0.1.46
	num-iter@0.1.45
	num-rational@0.4.2
	num-traits@0.2.19
	num@0.4.3
	num_cpus@1.17.0
	num_enum@0.7.6
	num_enum_derive@0.7.6
	nvml-wrapper-sys@0.9.1
	nvml-wrapper@0.12.1
	objc2-app-kit@0.3.2
	objc2-audio-toolbox@0.3.2
	objc2-avf-audio@0.3.2
	objc2-core-audio-types@0.3.2
	objc2-core-audio@0.3.2
	objc2-core-foundation@0.3.2
	objc2-core-graphics@0.3.2
	objc2-encode@4.1.0
	objc2-foundation@0.3.2
	objc2-io-surface@0.3.2
	objc2-metal@0.3.2
	objc2@0.6.4
	object@0.39.1
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	openssl-probe@0.2.1
	option-ext@0.2.0
	ordered-stream@0.2.0
	outref@0.5.2
	parking@2.2.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	paste@1.0.15
	percent-encoding@2.3.2
	petgraph@0.6.5
	pin-project-lite@0.2.17
	piper@0.2.5
	pkg-config@0.3.32
	plain@0.2.3
	polling@3.11.0
	portable-atomic-util@0.2.6
	portable-atomic@1.13.1
	postcard@1.1.3
	potential_utf@0.1.4
	ppv-lite86@0.2.21
	prettyplease@0.2.37
	primal-check@0.3.4
	proc-macro-crate@3.5.0
	proc-macro2@1.0.106
	pulley-interpreter@45.0.2
	pulley-macros@45.0.2
	quick-xml@0.39.2
	quote@1.0.45
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.10.1
	rand@0.9.2
	rand_chacha@0.9.0
	rand_core@0.10.1
	rand_core@0.9.5
	raw-window-handle@0.6.2
	rayon-core@1.13.0
	rayon@1.11.0
	realfft@3.5.0
	redox_syscall@0.5.18
	redox_syscall@0.9.0
	redox_users@0.4.6
	redox_users@0.5.2
	ref-cast-impl@1.0.25
	ref-cast@1.0.25
	referencing@0.46.5
	regalloc2@0.15.1
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	reqwest@0.13.2
	ring@0.17.14
	rubato@3.0.0
	rustc-demangle@0.1.27
	rustc-hash@2.1.1
	rustfft@6.4.1
	rustix-linux-procfs@0.1.1
	rustix@1.1.4
	rustls-native-certs@0.8.3
	rustls-pki-types@1.14.0
	rustls-platform-verifier-android@0.1.1
	rustls-platform-verifier@0.6.2
	rustls-webpki@0.103.13
	rustls@0.23.37
	rustversion@1.0.22
	ryu@1.0.23
	same-file@1.0.6
	schannel@0.1.29
	dyn-clone@1.0.20
	schemars@1.2.1
	schemars_derive@1.2.1
	serde_derive_internals@0.29.1
	scoped-tls@1.0.1
	scopeguard@1.2.0
	security-framework-sys@2.17.0
	security-framework@3.7.0
	semver@1.0.28
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.151
	serde_path_to_error@0.1.20
	serde_repr@0.1.20
	serde_spanned@1.1.0
	serde_urlencoded@0.7.1
	sha1@0.10.6
	sha2@0.10.9
	shlex@1.3.0
	signal-hook-registry@1.4.8
	simd-adler32@0.3.8
	similar@2.7.0
	slab@0.4.12
	smallvec@1.15.1
	socket2@0.6.3
	spdx@0.13.4
	spectrum-analyzer@1.7.0
	stable_deref_trait@1.2.1
	static_assertions@1.1.0
	strength_reduce@0.2.4
	strsim@0.11.1
	strum@0.28.0
	strum_macros@0.28.0
	subtle@2.6.1
	syn@2.0.117
	syn@3.0.3
	sync_wrapper@1.0.2
	synstructure@0.13.2
	tar@0.4.46
	target-lexicon@0.13.5
	tempfile@3.27.0
	termcolor@1.4.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	tinystr@0.8.2
	tokio-macros@2.7.0
	tokio-rustls@0.26.4
	tokio-stream@0.1.19
	tokio-tungstenite@0.29.0
	tokio-util@0.7.18
	tokio@1.52.3
	toml@0.9.12+spec-1.1.0
	toml@1.1.0+spec-1.1.0
	toml_datetime@0.7.5+spec-1.1.0
	toml_datetime@1.1.0+spec-1.1.0
	toml_edit@0.25.8+spec-1.1.0
	toml_parser@1.1.0+spec-1.1.0
	toml_writer@1.1.0+spec-1.1.0
	tower-http@0.6.8
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.3
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing@0.1.44
	transpose@0.2.3
	try-lock@0.2.5
	tungstenite@0.29.0
	typenum@1.19.0
	uds_windows@1.2.1
	ulid@1.2.1
	unicase@2.9.0
	unicode-general-category@1.1.0
	unicode-ident@1.0.24
	unicode-width@0.2.2
	unicode-xid@0.2.6
	untrusted@0.9.0
	url@2.5.8
	urlencoding@2.1.3
	utf8_iter@1.0.4
	utf8parse@0.2.2
	uuid-simd@0.8.0
	uuid@1.23.0
	version_check@0.9.5
	visibility@0.1.1
	vsimd@0.8.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.2+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-bindgen-futures@0.4.64
	wasm-bindgen-macro-support@0.2.114
	wasm-bindgen-macro@0.2.114
	wasm-bindgen-shared@0.2.114
	wasm-bindgen@0.2.114
	wasm-compose@0.248.0
	wasm-encoder@0.244.0
	wasm-encoder@0.248.0
	wasm-encoder@0.250.0
	wasm-metadata@0.244.0
	wasm-streams@0.5.0
	wasmparser@0.244.0
	wasmparser@0.248.0
	wasmparser@0.250.0
	wasmprinter@0.248.0
	wasmtime-environ@45.0.2
	wasmtime-internal-cache@45.0.2
	wasmtime-internal-component-macro@45.0.2
	wasmtime-internal-component-util@45.0.2
	wasmtime-internal-core@45.0.2
	wasmtime-internal-cranelift@45.0.2
	wasmtime-internal-fiber@45.0.2
	wasmtime-internal-jit-debug@45.0.2
	wasmtime-internal-jit-icache-coherence@45.0.2
	wasmtime-internal-unwinder@45.0.2
	wasmtime-internal-versioned-export-macros@45.0.2
	wasmtime-internal-winch@45.0.2
	wasmtime-internal-wit-bindgen@45.0.2
	wasmtime-wasi-http@45.0.0
	wasmtime-wasi-io@45.0.2
	wasmtime-wasi@45.0.2
	wasmtime@45.0.2
	wast@250.0.0
	wast@35.0.2
	wat@1.250.0
	wayland-backend@0.3.15
	wayland-client@0.31.14
	wayland-protocols-misc@0.3.11
	wayland-protocols-wlr@0.3.12
	wayland-protocols@0.32.13
	wayland-scanner@0.31.10
	wayland-server@0.31.13
	wayland-sys@0.31.11
	web-sys@0.3.91
	web-time@1.1.0
	webpki-root-certs@1.0.6
	webpki-roots@0.26.11
	webpki-roots@1.0.7
	wiggle-generate@45.0.2
	wiggle-macro@45.0.2
	wiggle@45.0.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	winch-codegen@45.0.2
	windowfunctions@0.1.1
	windows-collections@0.3.2
	windows-core@0.62.2
	windows-future@0.3.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-numerics@0.3.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.45.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-sys@0.61.2
	windows-targets@0.42.2
	windows-targets@0.52.6
	windows-threading@0.2.1
	windows@0.62.2
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.52.6
	winnow@0.7.15
	winnow@1.0.0
	winx@0.36.4
	wiremock@0.6.5
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-component@0.244.0
	wit-parser@0.244.0
	wit-parser@0.248.0
	witx@0.9.1
	wrapcenum-derive@0.4.1
	writeable@0.6.2
	xattr@1.6.1
	xkbcommon@0.9.0
	xkeysym@0.2.1
	yoke-derive@0.8.1
	yoke@0.8.1
	zbus@5.18.0
	zbus_macros@5.18.0
	zbus_names@4.3.4
	zerocopy-derive@0.8.47
	zerocopy@0.8.47
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zeroize@1.8.2
	zeroize_derive@1.4.3
	zerotrie@0.2.3
	zerovec-derive@0.11.2
	zerovec@0.11.5
	zmij@1.0.21
	zstd-safe@7.2.4
	zstd-sys@2.0.16+zstd.1.5.7
	zstd@0.13.3
	zvariant@5.13.1
	zvariant_derive@5.13.1
	zvariant_utils@3.5.0
"

declare -A GIT_CRATES=(
	[enigo]='https://github.com/jorge-menjivar/enigo;b2059c6d7a2a35927ce67b920f9521c47ad5c93e;enigo-%commit%'
)

inherit cargo systemd

DESCRIPTION="Speak into any app on Linux; a background daemon types your words"
HOMEPAGE="https://github.com/jorge-menjivar/super-stt"
SRC_URI="
	https://github.com/jorge-menjivar/super-stt/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+="
	0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 BSD BSD-2
	CDLA-Permissive-2.0 GPL-2 ISC LGPL-2.1+ MIT MIT-0 MPL-2.0 Unicode-3.0
	Unlicense ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl:=
	media-libs/alsa-lib
	sys-apps/dbus
	x11-libs/libxkbcommon
"
RDEPEND="${DEPEND}"

# The desktop settings app, COSMIC panel applet, and consent-prompt helper
# all pull in libcosmic, a git-only dependency (no crates.io releases) for
# the COSMIC desktop's GUI toolkit. Only the daemon and CLI are built;
# dictation via `stt record --write` works fully, but third-party apps
# using the daemon's HTTP protocol will get `popup_failed` on
# /auth/request since no consent-prompt UI is installed.

src_prepare() {
	default

	# Drop the libcosmic-dependent GUI crates from the workspace member list
	# entirely. `cargo build -p ...` still resolves the whole workspace graph
	# even when scoped, so as long as these stay workspace members cargo
	# tries to fetch libcosmic (git-only, no crates.io release) regardless
	# of which packages are actually being built.
	sed -i \
		-e '/^[[:space:]]*"super-stt-app",$/d' \
		-e '/^[[:space:]]*"super-stt-consent",$/d' \
		-e '/^[[:space:]]*"super-stt-cosmic-applet",$/d' \
		Cargo.toml || die "Failed to drop libcosmic-dependent members from Cargo.toml"

	# cargo's [patch] mechanism in config.toml fails in offline mode when the
	# lock file still references the git source. Replace the workspace's git
	# dep on enigo with the extracted local path so cargo never tries to
	# reach the network. The upstream Cargo.toml entry is a multi-line inline
	# table with no pinned rev, so match across lines rather than sed -i.
	local commit="b2059c6d7a2a35927ce67b920f9521c47ad5c93e"
	local path_dep="enigo = { path = \"${WORKDIR}/enigo-${commit}\", default-features = false, features = [\"wayland\"] }"
	PATCH_ENIGO="${path_dep}" perl -0777 -pi -e 's/enigo = \{.*?\n\s*\}/$ENV{PATCH_ENIGO}/s' Cargo.toml \
		|| die "Failed to patch Cargo.toml for enigo"
	grep -q 'enigo = { path' Cargo.toml || die "enigo patch did not apply"

	# Strip the git source line from Cargo.lock; path deps carry no source entry.
	sed -i '/^source = "git+https:\/\/github\.com\/jorge-menjivar\/enigo/d' Cargo.lock \
		|| die "Failed to patch Cargo.lock for enigo"
}

src_compile() {
	# Scope the build to the daemon and CLI only; other workspace members
	# (super-stt-app, super-stt-consent, super-stt-cosmic-applet) pull in
	# libcosmic, which cargo_src_compile's default whole-workspace build
	# would otherwise try to build too.
	cargo_src_compile -p super-stt-daemon -p super-stt-cli
}

src_install() {
	cargo_src_install --path ./super-stt-daemon
	cargo_src_install --path ./super-stt-cli

	# The upstream installer creates this as a plain wrapper around the
	# CLI binary (see justfile's install-daemon), not a build artifact.
	cat <<-EOF > "${T}"/stt
	#!/bin/sh
	exec super-stt-cli "\$@"
	EOF
	exeinto /usr/bin
	doexe "${T}"/stt

	systemd_douserunit super-stt-daemon/systemd/super-stt.service

	einstalldocs
}
