# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.17.0
	adler-1.0.2
	ahash-0.7.6
	aho-corasick-0.7.18
	ansi_term-0.12.1
	async-attributes-1.1.2
	async-channel-1.7.1
	async-executor-1.4.1
	async-global-executor-2.3.0
	async-io-1.8.0
	async-lock-2.5.0
	async-process-1.5.0
	async-recursion-1.0.0
	async-std-1.12.0
	async-std-resolver-0.22.0
	async-task-4.3.0
	async-trait-0.1.57
	atomic-waker-1.0.0
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.66
	base64-0.13.0
	bitflags-1.3.2
	blocking-1.2.0
	bumpalo-3.11.0
	byteorder-1.4.3
	bytes-1.2.1
	cache-padded-1.2.0
	cc-1.0.73
	cfg-if-1.0.0
	clap-3.2.18
	clap_derive-3.2.18
	clap_lex-0.2.4
	concurrent-queue-1.2.4
	console-0.15.1
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	crossbeam-utils-0.8.11
	ctor-0.1.23
	data-encoding-2.3.2
	encode_unicode-0.3.6
	endian-type-0.1.2
	enum-as-inner-0.5.1
	event-listener-2.5.3
	fallible-iterator-0.2.0
	fallible-streaming-iterator-0.1.9
	fastrand-1.8.0
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	futures-0.3.24
	futures-channel-0.3.24
	futures-core-0.3.24
	futures-executor-0.3.24
	futures-io-0.3.24
	futures-lite-1.12.0
	futures-macro-0.3.24
	futures-sink-0.3.24
	futures-task-0.3.24
	futures-util-0.3.24
	fxhash-0.2.1
	getrandom-0.2.7
	gimli-0.26.2
	gloo-timers-0.2.4
	h2-0.3.14
	hashbrown-0.12.3
	hashlink-0.8.0
	heck-0.4.0
	hermit-abi-0.1.19
	hostname-0.3.1
	http-0.2.8
	idna-0.2.3
	indexmap-1.9.1
	instant-0.1.12
	ipconfig-0.3.0
	ipnet-2.5.0
	itoa-1.0.3
	js-sys-0.3.59
	kv-log-macro-1.0.7
	lazy_static-1.4.0
	libc-0.2.132
	libsqlite3-sys-0.25.1
	linked-hash-map-0.5.6
	lock_api-0.4.8
	log-0.4.17
	lru-cache-0.1.2
	match_cfg-0.1.0
	matchers-0.1.0
	matches-0.1.9
	memchr-2.5.0
	miniz_oxide-0.5.3
	mio-0.8.4
	native-tls-0.2.10
	nibble_vec-0.1.0
	num_cpus-1.13.1
	num_threads-0.1.6
	object-0.29.0
	once_cell-1.13.1
	openssl-0.10.41
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-sys-0.9.75
	os_str_bytes-6.3.0
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	percent-encoding-2.1.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	polling-2.3.0
	ppv-lite86-0.2.16
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.43
	quick-error-1.2.3
	quinn-0.8.5
	quinn-proto-0.8.4
	quinn-udp-0.1.3
	quote-1.0.21
	radix_trie-0.2.1
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	redox_syscall-0.2.16
	regex-1.6.0
	regex-automata-0.1.10
	regex-syntax-0.6.27
	remove_dir_all-0.5.3
	resolv-conf-0.7.0
	ring-0.16.20
	rusqlite-0.28.0
	rustc-demangle-0.1.21
	rustls-0.20.6
	rustls-native-certs-0.6.2
	rustls-pemfile-0.2.1
	rustls-pemfile-1.0.1
	schannel-0.1.20
	scopeguard-1.1.0
	sct-0.7.0
	security-framework-2.7.0
	security-framework-sys-2.6.1
	serde-1.0.144
	serde_derive-1.0.144
	sharded-slab-0.1.4
	signal-hook-0.3.14
	signal-hook-registry-1.4.0
	slab-0.4.7
	smallvec-1.9.0
	socket2-0.4.6
	spin-0.5.2
	strsim-0.10.0
	syn-1.0.99
	tempfile-3.3.0
	termcolor-1.1.3
	terminal_size-0.1.17
	textwrap-0.15.0
	thiserror-1.0.32
	thiserror-impl-1.0.32
	thread_local-1.1.4
	time-0.3.14
	time-macros-0.2.4
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-1.20.1
	tokio-macros-1.8.0
	tokio-native-tls-0.3.0
	tokio-openssl-0.6.3
	tokio-rustls-0.23.4
	tokio-util-0.7.3
	toml-0.5.9
	tracing-0.1.36
	tracing-attributes-0.1.22
	tracing-core-0.1.29
	tracing-log-0.1.3
	tracing-subscriber-0.3.15
	trust-dns-client-0.22.0
	trust-dns-proto-0.22.0
	trust-dns-recursor-0.22.0
	trust-dns-resolver-0.22.0
	trust-dns-server-0.22.0
	trust-dns-util-0.22.0
	unicode-bidi-0.3.8
	unicode-ident-1.0.3
	unicode-normalization-0.1.21
	unicode-width-0.1.9
	untrusted-0.7.1
	url-2.2.2
	valuable-0.1.0
	value-bag-1.0.0-alpha.9
	vcpkg-0.2.15
	version_check-0.9.4
	waker-fn-1.1.0
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.82
	wasm-bindgen-backend-0.2.82
	wasm-bindgen-futures-0.4.32
	wasm-bindgen-macro-0.2.82
	wasm-bindgen-macro-support-0.2.82
	wasm-bindgen-shared-0.2.82
	web-sys-0.3.59
	webpki-0.22.0
	webpki-roots-0.22.4
	wepoll-ffi-0.1.2
	widestring-0.5.1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
	winreg-0.7.0
"

inherit cargo

DESCRIPTION="A Rust based DNS client, server, and resolver"
HOMEPAGE="https://github.com/bluejekyll/trust-dns"
SRC_URI="
	https://github.com/bluejekyll/trust-dns/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="|| ( >=dev-lang/rust-1.59.0 >=dev-lang/rust-bin-1.59.0 )"

src_install() {
	dobin target/release/{named,resolve,trust-dns,named}
	einstalldocs
}