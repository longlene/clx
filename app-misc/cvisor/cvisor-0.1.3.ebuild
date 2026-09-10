# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	Inflector@0.11.4
	actix-codec@0.5.2
	actix-cors@0.7.1
	actix-http@3.13.3
	actix-macros@0.2.4
	actix-router@0.5.4
	actix-rt@2.11.0
	actix-server@2.7.0
	actix-service@2.0.3
	actix-utils@3.0.1
	actix-web-actors@4.3.1+deprecated
	actix-web-codegen@4.3.0
	actix-web@4.14.1
	actix@0.13.5
	actix_derive@0.6.2
	adler2@2.0.1
	aho-corasick@1.1.5
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.4
	allocator-api2@0.2.21
	anyhow@1.0.104
	ascii@1.1.0
	ascii_utils@0.9.3
	async-channel@2.5.0
	async-graphql-actix-web@7.2.1
	async-graphql-derive@7.2.1
	async-graphql-parser@7.2.1
	async-graphql-value@7.2.1
	async-graphql@7.2.1
	async-io@2.6.0
	async-stream-impl@0.3.6
	async-stream@0.3.6
	async-trait@0.1.92
	asynk-strim@0.1.5
	atoi@2.0.0
	atomic-waker@1.1.2
	attohttpc@0.28.5
	autocfg@1.5.1
	aws-creds@0.37.0
	aws-region@0.25.5
	axum-core@0.4.5
	axum@0.7.9
	base64@0.21.7
	base64@0.22.1
	bitflags@2.13.1
	block-buffer@0.10.4
	block-buffer@0.12.1
	block_on_proc@0.2.0
	brotli-decompressor@5.0.3
	brotli@8.0.4
	bstr@1.13.1
	byteorder@1.5.0
	bytes@1.12.1
	bytestring@1.5.1
	cc@1.4.3
	cfg-if@1.0.4
	cfg_aliases@0.2.2
	chacha20@0.10.1
	chunked_transfer@1.5.0
	concurrent-queue@2.5.0
	const-oid@0.10.2
	const-random-macro@0.1.16
	const-random@0.1.18
	convert_case@0.10.0
	convert_case@0.11.0
	cookie@0.16.2
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	cpufeatures@0.2.17
	cpufeatures@0.3.0
	crc-catalog@2.5.0
	crc32fast@1.5.0
	crc@3.4.0
	crossbeam-channel@0.5.16
	crossbeam-deque@0.8.7
	crossbeam-epoch@0.9.20
	crossbeam-queue@0.3.13
	crossbeam-utils@0.8.22
	crunchy@0.2.4
	crypto-common@0.1.7
	crypto-common@0.2.2
	ctor@1.0.13
	darling@0.20.11
	darling@0.23.0
	darling_core@0.20.11
	darling_core@0.23.0
	darling_macro@0.20.11
	darling_macro@0.23.0
	data-encoding@2.11.1
	deranged@0.5.8
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	derive_more-impl@2.1.1
	derive_more@2.1.1
	digest@0.10.7
	digest@0.11.3
	displaydoc@0.2.7
	dlv-list@0.5.2
	dotenvy@0.15.7
	either@1.17.0
	encoding_rs@0.8.35
	equivalent@1.0.2
	errno@0.3.14
	event-listener-strategy@0.5.4
	event-listener@5.4.2
	fast_chemail@0.9.6
	fastrand@2.5.0
	filetime@0.2.29
	find-msvc-tools@0.1.11
	fixedbitset@0.5.7
	flate2@1.1.9
	flume@0.11.1
	fnv@1.0.7
	foldhash@0.1.5
	foldhash@0.2.0
	form_urlencoded@1.2.2
	futures-channel@0.3.34
	futures-core@0.3.34
	futures-executor@0.3.34
	futures-intrusive@0.5.0
	futures-io@0.3.34
	futures-lite@2.6.1
	futures-macro@0.3.34
	futures-sink@0.3.34
	futures-task@0.3.34
	futures-util@0.3.34
	futures@0.3.34
	generic-array@0.14.7
	getrandom@0.2.17
	getrandom@0.3.4
	getrandom@0.4.3
	globset@0.4.20
	h2@0.3.27
	h2@0.4.15
	handlebars@6.4.4
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.5
	hashbrown@0.17.1
	hashlink@0.10.0
	heck@0.5.0
	hermit-abi@0.5.2
	hex@0.4.3
	hmac@0.12.1
	home@0.5.12
	http-body-util@0.1.5
	http-body@0.4.6
	http-body@1.1.0
	http@0.2.12
	http@1.5.0
	httparse@1.10.1
	httpdate@1.0.3
	hybrid-array@0.4.14
	hyper-rustls@0.24.2
	hyper-timeout@0.5.2
	hyper-util@0.1.20
	hyper@0.14.32
	hyper@1.11.0
	icu_collections@2.3.0
	icu_locale_core@2.3.0
	icu_normalizer@2.3.0
	icu_normalizer_data@2.3.0
	icu_properties@2.3.0
	icu_properties_data@2.3.0
	icu_provider@2.3.0
	ident_case@1.0.1
	idna@1.1.0
	idna_adapter@1.2.2
	ignore@0.4.33
	impl-more@0.3.5
	indexmap@1.9.3
	indexmap@2.14.0
	is-docker@0.2.0
	is-wsl@0.4.0
	itertools@0.14.0
	itoa@1.0.18
	jobserver@0.1.35
	language-tags@0.3.2
	libc@0.2.189
	libloading@0.9.0
	libsqlite3-sys@0.30.1
	linux-raw-sys@0.12.1
	litemap@0.8.3
	local-channel@0.1.5
	local-waker@0.1.4
	lock_api@0.4.14
	log@0.4.33
	matchit@0.7.3
	maybe-async@0.2.11
	md5@0.7.0
	memchr@2.8.3
	memoffset@0.9.1
	mime@0.3.17
	mime_guess@2.0.5
	miniz_oxide@0.8.9
	mio@1.2.2
	multer@3.1.0
	multimap@0.10.1
	napi-build@2.4.1
	napi-derive-backend@6.1.2
	napi-derive@3.6.3
	napi-sys@3.3.0
	napi@3.12.1
	nix@0.30.1
	nohash-hasher@0.2.0
	num-conv@0.2.2
	num-modular@0.6.5
	num-order@1.2.0
	num-traits@0.2.19
	once_cell@1.21.4
	open@5.4.1
	openssl-probe@0.1.6
	ordered-multimap@0.7.3
	parking@2.2.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	percent-encoding@2.3.2
	pest@2.9.0
	pest_derive@2.9.0
	pest_generator@2.9.0
	pest_meta@2.9.0
	petgraph@0.7.1
	pin-project-internal@1.1.13
	pin-project-lite@0.2.17
	pin-project@1.1.13
	pkg-config@0.3.34
	polling@3.11.0
	potential_utf@0.1.6
	powerfmt@0.2.0
	ppv-lite86@0.2.21
	prettyplease@0.2.37
	proc-macro-crate@3.5.0
	proc-macro2@1.0.107
	prost-build@0.13.5
	prost-derive@0.13.5
	prost-types@0.13.5
	prost@0.13.5
	protoc-bin-vendored-linux-aarch_64@3.2.0
	protoc-bin-vendored-linux-ppcle_64@3.2.0
	protoc-bin-vendored-linux-s390_64@3.2.0
	protoc-bin-vendored-linux-x86_32@3.2.0
	protoc-bin-vendored-linux-x86_64@3.2.0
	protoc-bin-vendored-macos-aarch_64@3.2.0
	protoc-bin-vendored-macos-x86_64@3.2.0
	protoc-bin-vendored-win32@3.2.0
	protoc-bin-vendored@3.2.0
	quick-xml@0.32.0
	quote@1.0.47
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.10.2
	rand@0.8.7
	rand_chacha@0.3.1
	rand_core@0.10.1
	rand_core@0.6.4
	redox_syscall@0.5.18
	regex-automata@0.4.18
	regex-lite@0.1.9
	regex-syntax@0.8.11
	regex@1.13.1
	ring@0.17.14
	rust-embed-impl@8.12.0
	rust-embed-utils@8.12.0
	rust-embed@8.12.0
	rust-ini@0.21.3
	rust-s3@0.35.1
	rustc-hash@2.1.3
	rustc_version@0.4.1
	rustix@1.1.4
	rustls-native-certs@0.6.3
	rustls-native-certs@0.7.3
	rustls-pemfile@1.0.4
	rustls-pemfile@2.2.0
	rustls-pki-types@1.15.1
	rustls-webpki@0.101.7
	rustls-webpki@0.103.14
	rustls@0.21.12
	rustls@0.23.43
	rustversion@1.0.23
	ryu@1.0.23
	same-file@1.0.6
	schannel@0.1.29
	scopeguard@1.2.0
	sct@0.7.1
	security-framework-sys@2.17.0
	security-framework@2.11.1
	semver@1.0.28
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	serde_urlencoded@0.7.1
	sha1@0.10.7
	sha1@0.11.0
	sha2@0.10.9
	sha2@0.11.0
	shlex@2.0.1
	signal-hook-registry@1.4.8
	simd-adler32@0.3.10
	slab@0.4.12
	smallvec@1.15.2
	socket2@0.5.10
	socket2@0.6.5
	spin@0.9.9
	sqlx-core@0.8.6
	sqlx-macros-core@0.8.6
	sqlx-macros@0.8.6
	sqlx-sqlite@0.8.6
	sqlx@0.8.6
	stable_deref_trait@1.2.1
	static_assertions_next@1.1.2
	strsim@0.11.1
	strum@0.27.2
	strum_macros@0.27.2
	subtle@2.6.1
	syn@1.0.109
	syn@2.0.119
	syn@3.0.3
	sync_wrapper@1.0.2
	synstructure@0.13.2
	tar@0.4.46
	tempfile@3.27.0
	thiserror-impl@1.0.69
	thiserror-impl@2.0.20
	thiserror@1.0.69
	thiserror@2.0.20
	time-core@0.1.9
	time-macros@0.2.32
	time@0.3.55
	tiny-keccak@2.0.2
	tiny_http@0.12.0
	tinystr@0.8.4
	tokio-macros@2.7.2
	tokio-rustls@0.24.1
	tokio-stream@0.1.19
	tokio-util@0.7.19
	tokio@1.53.1
	toml_datetime@1.1.1+spec-1.1.0
	toml_edit@0.25.13+spec-1.1.0
	toml_parser@1.1.3+spec-1.1.0
	tonic-build@0.12.3
	tonic-reflection@0.12.3
	tonic@0.12.3
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.4.13
	tower@0.5.3
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing@0.1.44
	try-lock@0.2.5
	tungstenite@0.24.0
	typenum@1.20.1
	ucd-trie@0.1.7
	unicase@2.9.0
	unicode-ident@1.0.24
	unicode-segmentation@1.13.3
	unicode-xid@0.2.6
	untrusted@0.9.0
	ureq@2.12.1
	url@2.5.8
	utf-8@0.7.6
	utf8_iter@1.0.4
	vcpkg@0.2.15
	version_check@0.9.5
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.4+wasi-0.2.12
	webpki-roots@0.26.11
	webpki-roots@1.0.9
	winapi-util@0.1.11
	windows-link@0.2.1
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
	winnow@1.0.4
	wit-bindgen@0.57.1
	writeable@0.6.4
	xattr@1.6.1
	yoke-derive@0.8.2
	yoke@0.8.3
	zerocopy-derive@0.8.56
	zerocopy@0.8.56
	zerofrom-derive@0.1.7
	zerofrom@0.1.8
	zeroize@1.9.0
	zerotrie@0.2.5
	zerovec-derive@0.11.4
	zerovec@0.11.7
	zmij@1.0.23
	zstd-safe@7.2.4
	zstd-sys@2.0.16+zstd.1.5.7
	zstd@0.13.3
"

RUST_MIN_VER="1.89.0"

inherit cargo

DESCRIPTION="Embedded bash sandbox for agents, inspired by gVisor"
HOMEPAGE="https://github.com/tsirysndr/cVisor"
SRC_URI="
	https://github.com/tsirysndr/cVisor/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/cVisor-${PV}"

LICENSE="
	Apache-2.0 BSD-2 BSD CC0-1.0 CDLA-Permissive-2.0 ISC MIT MPL-2.0
	Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

IUSE="daemon ffi s3 zstd"

BDEPEND="dev-libs/protobuf"
DEPEND="daemon? ( dev-db/sqlite:3 )"
RDEPEND="${DEPEND}"

src_prepare() {
	# bsdkrun-sdk is a macOS-only microVM dependency (used to drive the sandbox
	# from a bsdkrun microVM when not on Linux); the pinned commit's manifest
	# doesn't resolve, so strip it rather than fetch a broken git snapshot for
	# a target this ebuild never builds.
	sed -i '/^bsdkrun-sdk = { git = /d' crates/cvisor-cli/Cargo.toml || die
	perl -0pi -e 's/\[\[package\]\]\nname = "bsdkrun-sdk"\n.*?\n\n//s' Cargo.lock || die
	perl -0pi -e 's/ "bsdkrun-sdk",\n//' Cargo.lock || die

	default
}

src_compile() {
	export PROTOC="${BROOT}/usr/bin/protoc"

	local myfeatures=()
	use zstd && myfeatures+=( zstd )
	use s3 && myfeatures+=( s3 )
	local feature_args=()
	[[ -n ${myfeatures[*]} ]] && feature_args=( --features "$(IFS=,; echo "${myfeatures[*]}")" )

	cargo_src_compile -p cvisor-cli "${feature_args[@]}"

	if use daemon; then
		cargo_src_compile -p cvisor-daemon "${feature_args[@]}"
	fi
	if use ffi; then
		cargo_src_compile -p cvisor-ffi "${feature_args[@]}"
	fi
}

src_install() {
	export PROTOC="${BROOT}/usr/bin/protoc"

	cargo_src_install --path crates/cvisor-cli
	if use daemon; then
		cargo_src_install --path crates/cvisor-daemon
	fi
	if use ffi; then
		dolib.so "$(cargo_target_dir)/libcvisor.so"
	fi
	dodoc README.md
}
