# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2@2.0.1
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.2
	arc-swap@1.9.1
	async-channel@2.5.0
	async-compression@0.4.37
	async-trait@0.1.89
	atomic-waker@1.1.2
	aws-lc-rs@1.15.4
	aws-lc-sys@0.37.0
	backoff@0.4.0
	base64@0.22.1
	bitflags@2.10.0
	brotli-decompressor@5.0.0
	brotli@8.0.2
	bumpalo@3.19.1
	bytes@1.11.1
	cc@1.2.54
	cesu8@1.1.0
	cfg-if@1.0.4
	cfg_aliases@0.2.1
	cmake@0.1.57
	combine@4.6.7
	compression-codecs@0.4.36
	compression-core@0.4.31
	concurrent-queue@2.5.0
	cookie@0.18.1
	cookie_store@0.22.1
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	core-foundation@0.9.4
	crc32fast@1.5.0
	critical-section@1.2.0
	crossbeam-channel@0.5.15
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	data-encoding@2.10.0
	deranged@0.5.8
	displaydoc@0.2.5
	document-features@0.2.12
	dunce@1.0.5
	encoding_rs@0.8.35
	enum-as-inner@0.6.1
	equivalent@1.0.2
	errors@0.1.0
	event-listener-strategy@0.5.4
	event-listener@5.4.1
	fastrand@2.3.0
	find-msvc-tools@0.1.8
	flate2@1.1.8
	fnv@1.0.7
	form_urlencoded@1.2.2
	fs_extra@1.3.0
	futures-channel@0.3.31
	futures-core@0.3.32
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	getrandom@0.2.17
	getrandom@0.3.4
	h2@0.4.13
	h3-quinn@0.0.10
	h3@0.0.8
	hashbrown@0.16.1
	heck@0.5.0
	hickory-proto@0.25.2
	hickory-resolver@0.25.2
	http-body-util@0.1.3
	http-body@1.0.1
	http@1.4.0
	httparse@1.10.1
	hyper-rustls@0.27.7
	hyper-util@0.1.19
	hyper@1.8.1
	icu_collections@2.1.1
	icu_locale_core@2.1.1
	icu_normalizer@2.1.1
	icu_normalizer_data@2.1.1
	icu_properties@2.1.2
	icu_properties_data@2.1.2
	icu_provider@2.1.1
	idna@1.1.0
	idna_adapter@1.2.1
	indexmap@2.13.0
	instant@0.1.13
	ipconfig@0.3.2
	ipnet@2.11.0
	iri-string@0.7.10
	itoa@1.0.17
	jni-sys@0.3.0
	jni@0.21.1
	jobserver@0.1.34
	js-sys@0.3.85
	libc@0.2.184
	litemap@0.8.1
	litrs@1.0.0
	lock_api@0.4.14
	log@0.4.29
	lru-slab@0.1.2
	memchr@2.7.6
	mime@0.3.17
	miniz_oxide@0.8.9
	mio@1.2.0
	moka@0.12.13
	num-conv@0.2.1
	once_cell@1.21.3
	openssl-probe@0.2.1
	parking@2.2.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	percent-encoding@2.3.2
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	pkg-config@0.3.32
	portable-atomic@1.13.0
	potential_utf@0.1.4
	powerfmt@0.2.0
	ppv-lite86@0.2.21
	proc-macro2@1.0.106
	psl-types@2.0.11
	publicsuffix@2.3.0
	pyo3-async-runtimes@0.28.0
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quinn-proto@0.11.13
	quinn-udp@0.5.14
	quinn@0.11.9
	quote@1.0.44
	r-efi@5.3.0
	rand@0.8.5
	rand@0.9.2
	rand_chacha@0.3.1
	rand_chacha@0.9.0
	rand_core@0.6.4
	rand_core@0.9.5
	redox_syscall@0.5.18
	resolv-conf@0.7.6
	ring@0.17.14
	rustc-hash@2.1.1
	rustls-native-certs@0.8.3
	rustls-pki-types@1.14.0
	rustls-platform-verifier-android@0.1.1
	rustls-platform-verifier@0.6.2
	rustls-webpki@0.103.9
	rustls@0.23.36
	rustversion@1.0.22
	same-file@1.0.6
	schannel@0.1.28
	scopeguard@1.2.0
	security-framework-sys@2.15.0
	security-framework@3.5.1
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	shlex@1.3.0
	simd-adler32@0.3.8
	slab@0.4.11
	smallvec@1.15.1
	socket2@0.5.10
	socket2@0.6.3
	stable_deref_trait@1.2.1
	subtle@2.6.1
	syn@2.0.114
	sync_wrapper@1.0.2
	synstructure@0.13.2
	system-configuration-sys@0.6.0
	system-configuration@0.6.1
	tagptr@0.2.0
	target-lexicon@0.13.4
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	time-core@0.1.8
	time-macros@0.2.27
	time@0.3.47
	tinystr@0.8.2
	tinyvec@1.10.0
	tinyvec_macros@0.1.1
	tokio-macros@2.7.0
	tokio-rustls@0.26.4
	tokio-stream@0.1.18
	tokio-util@0.7.18
	tokio@1.51.1
	tower-http@0.6.8
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.3
	tracing-core@0.1.36
	tracing@0.1.44
	try-lock@0.2.5
	unicode-ident@1.0.22
	untrusted@0.9.0
	url@2.5.8
	utf8_iter@1.0.4
	uuid@1.20.0
	version_check@0.9.5
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.2+wasi-0.2.9
	wasm-bindgen-futures@0.4.58
	wasm-bindgen-macro-support@0.2.108
	wasm-bindgen-macro@0.2.108
	wasm-bindgen-shared@0.2.108
	wasm-bindgen@0.2.108
	wasm-streams@0.5.0
	web-sys@0.3.85
	web-time@1.1.0
	webpki-root-certs@1.0.5
	widestring@1.2.1
	winapi-util@0.1.11
	windows-link@0.2.1
	windows-registry@0.6.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.61.2
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winreg@0.50.0
	wit-bindgen@0.51.0
	writeable@0.6.2
	yoke-derive@0.8.1
	yoke@0.8.1
	zerocopy-derive@0.8.34
	zerocopy@0.8.34
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zeroize@1.8.2
	zerotrie@0.2.3
	zerovec-derive@0.11.2
	zerovec@0.11.5
	zmij@1.0.21
	zstd-safe@7.2.4
	zstd-sys@2.0.16+zstd.1.5.7
	zstd@0.13.3
"

declare -A GIT_CRATES=(
	[reqwest]='https://github.com/seanmonstar/reqwest;fa74a8b835b2f194253cebdab8d049c0e5d23af3;reqwest-%commit%'
)

RUST_MIN_VER="1.88"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

inherit cargo distutils-r1

DESCRIPTION="A modern Python HTTP client based on reqwest"
HOMEPAGE="
	https://pypi.org/project/pyqwest/
	https://github.com/curioswitch/pyqwest
	https://pyqwest.dev/
"
SRC_URI="
	https://github.com/curioswitch/pyqwest/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD CDLA-Permissive-2.0
	ISC openssl Unicode-3.0
"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export RUSTFLAGS='--cfg reqwest_unstable --cfg tokio_unstable'

src_prepare() {
	# [patch.crates-io] uses a git source which cargo cannot checkout offline.
	# Replace with the local path extracted from GIT_CRATES tarball.
	sed -i \
		's|reqwest = { git = "[^"]*", rev = "[^"]*" }|reqwest = { path = "'"${WORKDIR}/reqwest-fa74a8b835b2f194253cebdab8d049c0e5d23af3"'" }|' \
		"${S}/Cargo.toml" || die
	# Cargo.lock still references the old git source; drop it so cargo regenerates
	# the lock file using the patched path dependency.
	rm "${S}/Cargo.lock" || die
	distutils-r1_src_prepare
}
