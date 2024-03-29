# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.20.0
	adler-1.0.2
	afl-0.12.17
	aho-corasick-1.0.4
	anstream-0.3.2
	anstyle-1.0.1
	anstyle-parse-0.2.1
	anstyle-query-1.0.0
	anstyle-wincon-1.0.2
	anyhow-1.0.74
	async-compression-0.4.1
	async-trait-0.1.73
	autocfg-1.1.0
	backtrace-0.3.68
	base64-0.21.2
	bitflags-1.3.2
	bitflags-2.4.0
	block-buffer-0.10.4
	bumpalo-3.13.0
	byteorder-1.4.3
	bytes-1.4.0
	cc-1.0.82
	cfg-if-1.0.0
	clap-4.3.21
	clap_builder-4.3.21
	clap_lex-0.5.0
	colorchoice-1.0.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.4
	cpufeatures-0.2.9
	crc32fast-1.3.2
	crypto-common-0.1.6
	data-encoding-2.4.0
	die-0.2.0
	digest-0.10.7
	encoding_rs-0.8.32
	enum-as-inner-0.5.1
	env_logger-0.10.0
	equivalent-1.0.1
	errno-0.3.2
	errno-dragonfly-0.1.2
	fastrand-2.0.0
	flate2-1.0.27
	fnv-1.0.7
	form_urlencoded-1.2.0
	fs_extra-1.3.0
	futures-0.3.28
	futures-channel-0.3.28
	futures-core-0.3.28
	futures-executor-0.3.28
	futures-io-0.3.28
	futures-macro-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	fuzz-0.1.0
	generic-array-0.14.7
	getrandom-0.2.10
	gimli-0.27.3
	h2-0.3.20
	hashbrown-0.12.3
	hashbrown-0.14.0
	heck-0.4.1
	hermit-abi-0.3.2
	hex-0.4.3
	home-0.5.5
	hostname-0.3.1
	http-0.2.9
	http-body-0.4.5
	httparse-1.8.0
	httpdate-1.0.3
	humantime-2.1.0
	hyper-0.14.27
	hyper-rustls-0.24.1
	idna-0.2.3
	idna-0.4.0
	indexmap-1.9.3
	indexmap-2.0.0
	ipconfig-0.3.2
	ipnet-2.8.0
	is-terminal-0.4.9
	itoa-1.0.9
	js-sys-0.3.64
	lazy_static-1.4.0
	libc-0.2.147
	linked-hash-map-0.5.6
	linux-raw-sys-0.4.5
	lock_api-0.4.10
	log-0.4.20
	lru-cache-0.1.2
	match_cfg-0.1.0
	matches-0.1.10
	memchr-2.5.0
	memoffset-0.7.1
	mime-0.3.17
	miniz_oxide-0.7.1
	mio-0.8.8
	nix-0.26.2
	num_cpus-1.16.0
	object-0.31.1
	once_cell-1.18.0
	openssl-probe-0.1.5
	parking_lot-0.12.1
	parking_lot_core-0.9.8
	percent-encoding-2.3.0
	pin-project-lite-0.2.12
	pin-utils-0.1.0
	ppv-lite86-0.2.17
	proc-macro2-1.0.66
	quick-error-1.2.3
	quinn-0.10.2
	quinn-proto-0.10.2
	quinn-udp-0.4.0
	quote-1.0.32
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	redox_syscall-0.3.5
	regex-1.9.3
	regex-automata-0.3.6
	regex-syntax-0.7.4
	reqwest-0.11.18
	resolv-conf-0.7.0
	ring-0.16.20
	rustc-demangle-0.1.23
	rustc-hash-1.1.0
	rustc_version-0.4.0
	rustix-0.38.8
	rustls-0.21.6
	rustls-native-certs-0.6.3
	rustls-pemfile-1.0.3
	rustls-webpki-0.101.3
	rxml-0.9.1
	rxml_validation-0.9.1
	ryu-1.0.15
	schannel-0.1.22
	scopeguard-1.2.0
	sct-0.7.0
	security-framework-2.9.2
	security-framework-sys-2.9.1
	semver-1.0.18
	serde-1.0.183
	serde_derive-1.0.183
	serde_json-1.0.105
	serde_spanned-0.6.3
	serde_urlencoded-0.7.1
	sha1-0.10.5
	sha2-0.10.7
	sha256-1.3.0
	signal-hook-registry-1.4.1
	slab-0.4.8
	smallvec-1.11.0
	smartstring-1.0.1
	socket2-0.4.9
	socket2-0.5.3
	spin-0.5.2
	static_assertions-1.1.0
	strsim-0.10.0
	syn-1.0.109
	syn-2.0.28
	tempfile-3.7.1
	termcolor-1.2.0
	thiserror-1.0.46
	thiserror-impl-1.0.46
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	tokio-1.31.0
	tokio-macros-2.1.0
	tokio-rustls-0.24.1
	tokio-tungstenite-0.19.0
	tokio-util-0.7.8
	toml-0.7.6
	toml_datetime-0.6.3
	toml_edit-0.19.14
	tower-service-0.3.2
	tracing-0.1.37
	tracing-attributes-0.1.26
	tracing-core-0.1.31
	trust-dns-proto-0.22.0
	trust-dns-resolver-0.22.0
	try-lock-0.2.4
	tungstenite-0.19.0
	typenum-1.16.0
	unicode-bidi-0.3.13
	unicode-ident-1.0.11
	unicode-normalization-0.1.22
	untrusted-0.7.1
	url-2.4.0
	utf-8-0.7.6
	utf8parse-0.2.1
	version_check-0.9.4
	want-0.3.1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.87
	wasm-bindgen-backend-0.2.87
	wasm-bindgen-futures-0.4.37
	wasm-bindgen-macro-0.2.87
	wasm-bindgen-macro-support-0.2.87
	wasm-bindgen-shared-0.2.87
	web-sys-0.3.64
	webpki-roots-0.25.2
	widestring-1.0.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.48.0
	windows-targets-0.48.2
	windows_aarch64_gnullvm-0.48.2
	windows_aarch64_msvc-0.48.2
	windows_i686_gnu-0.48.2
	windows_i686_msvc-0.48.2
	windows_x86_64_gnu-0.48.2
	windows_x86_64_gnullvm-0.48.2
	windows_x86_64_msvc-0.48.2
	winnow-0.5.12
	winreg-0.10.1
	winreg-0.50.0
	xdg-2.5.2
"

inherit cargo

EGIT_COMMIT="d34ab513e9e1b4299748ef876a12e4d0a04ff0ac"

DESCRIPTION="XMPP reverse proxy and outgoing proxy"
HOMEPAGE="https://code.moparisthebest.com/moparisthebest/xmpp-proxy"
SRC_URI="
	https://github.com/moparisthebest/xmpp-proxy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.31.0
"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_install() {
	cargo_src_install
	einstalldocs
}
