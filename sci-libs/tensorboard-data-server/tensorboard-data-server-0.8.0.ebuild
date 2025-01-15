# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	aho-corasick@0.7.18
	anyhow@1.0.34
	async-stream-impl@0.3.0
	async-stream@0.3.0
	async-trait@0.1.41
	atty@0.2.14
	autocfg@1.0.1
	base64@0.13.0
	bitflags@1.2.1
	build_const@0.2.1
	bumpalo@3.12.0
	byteorder@1.3.4
	bytes@0.5.6
	bytes@1.0.1
	cc@1.0.66
	cfg-if@0.1.10
	cfg-if@1.0.0
	clap@3.0.0-beta.2
	clap_derive@3.0.0-beta.2
	const_fn@0.4.5
	core-foundation-sys@0.8.3
	core-foundation@0.9.3
	crc@1.8.1
	crossbeam-channel@0.5.0
	crossbeam-deque@0.8.1
	crossbeam-epoch@0.9.1
	crossbeam-queue@0.3.1
	crossbeam-utils@0.8.8
	crossbeam@0.8.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	either@1.6.1
	encoding_rs@0.8.26
	env_logger@0.8.2
	fixedbitset@0.4.1
	fnv@1.0.7
	form_urlencoded@1.0.0
	futures-channel@0.3.8
	futures-core@0.3.12
	futures-io@0.3.12
	futures-macro@0.3.8
	futures-sink@0.3.8
	futures-task@0.3.8
	futures-util@0.3.8
	gcp_auth@0.7.4
	getrandom@0.1.15
	getrandom@0.2.1
	h2@0.3.19
	hashbrown@0.11.2
	heck@0.3.1
	hermit-abi@0.1.17
	http-body@0.4.5
	http@0.2.1
	httparse@1.7.1
	httpdate@1.0.2
	humantime@2.0.1
	hyper-rustls@0.22.1
	hyper-rustls@0.23.0
	hyper-timeout@0.4.1
	hyper@0.14.19
	idna@0.2.0
	indexmap@1.8.2
	ipnet@2.3.0
	itertools@0.10.3
	itoa@0.4.6
	itoa@1.0.2
	js-sys@0.3.47
	lazy_static@1.4.0
	libc@0.2.126
	lock_api@0.4.6
	log@0.4.11
	matches@0.1.8
	memchr@2.5.0
	memoffset@0.6.5
	mime@0.3.16
	mio@0.8.3
	multimap@0.8.2
	num_cpus@1.13.0
	num_threads@0.1.6
	once_cell@1.5.2
	openssl-probe@0.1.5
	os_str_bytes@2.4.0
	parking_lot@0.12.1
	parking_lot_core@0.9.3
	percent-encoding@2.1.0
	petgraph@0.6.2
	pin-project-internal@1.0.12
	pin-project-lite@0.2.9
	pin-project@1.0.12
	pin-utils@0.1.0
	ppv-lite86@0.2.10
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro-hack@0.5.19
	proc-macro-nested@0.1.7
	proc-macro2@1.0.43
	prost-build@0.9.0
	prost-derive@0.9.0
	prost-types@0.9.0
	prost@0.9.0
	quote@1.0.7
	rand@0.7.3
	rand@0.8.2
	rand_chacha@0.2.2
	rand_chacha@0.3.0
	rand_core@0.5.1
	rand_core@0.6.1
	rand_hc@0.2.0
	rand_hc@0.3.0
	rayon-core@1.9.0
	rayon@1.5.0
	redox_syscall@0.1.57
	redox_syscall@0.2.16
	redox_users@0.4.3
	regex-syntax@0.6.26
	regex@1.5.6
	remove_dir_all@0.5.3
	reqwest@0.11.0
	ring@0.16.20
	rustls-native-certs@0.6.2
	rustls-pemfile@1.0.1
	rustls@0.19.0
	rustls@0.20.6
	ryu@1.0.5
	same-file@1.0.6
	schannel@0.1.20
	scopeguard@1.1.0
	sct@0.6.1
	sct@0.7.0
	security-framework-sys@2.6.1
	security-framework@2.3.1
	serde@1.0.144
	serde_derive@1.0.144
	serde_json@1.0.61
	serde_urlencoded@0.7.0
	slab@0.4.2
	smallvec@1.10.0
	socket2@0.4.4
	spin@0.5.2
	strsim@0.10.0
	syn@1.0.99
	tempfile@3.1.0
	termcolor@1.1.0
	textwrap@0.12.1
	thiserror-impl@1.0.22
	thiserror@1.0.22
	time@0.3.14
	tinyvec@1.1.1
	tinyvec_macros@0.1.0
	tokio-io-timeout@1.2.0
	tokio-macros@1.8.0
	tokio-rustls@0.22.0
	tokio-rustls@0.23.4
	tokio-stream@0.1.2
	tokio-util@0.6.6
	tokio-util@0.7.3
	tokio@1.19.2
	tonic-build@0.6.2
	tonic-reflection@0.3.0
	tonic@0.6.2
	tower-layer@0.3.1
	tower-service@0.3.0
	tower@0.4.11
	tracing-attributes@0.1.21
	tracing-core@0.1.26
	tracing-futures@0.2.5
	tracing@0.1.34
	try-lock@0.2.3
	unicode-bidi@0.3.4
	unicode-ident@1.0.3
	unicode-normalization@0.1.16
	unicode-segmentation@1.6.0
	unicode-width@0.1.8
	untrusted@0.7.1
	url@2.2.0
	vec_map@0.8.2
	version_check@0.9.2
	walkdir@2.3.1
	want@0.3.0
	wasi@0.10.1+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.70
	wasm-bindgen-futures@0.4.20
	wasm-bindgen-macro-support@0.2.70
	wasm-bindgen-macro@0.2.70
	wasm-bindgen-shared@0.2.70
	wasm-bindgen@0.2.70
	web-sys@0.3.47
	webpki-roots@0.21.1
	webpki@0.21.4
	webpki@0.22.0
	which@4.3.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.36.1
	windows_aarch64_msvc@0.36.1
	windows_i686_gnu@0.36.1
	windows_i686_msvc@0.36.1
	windows_x86_64_gnu@0.36.1
	windows_x86_64_msvc@0.36.1
	winreg@0.7.0
"

inherit cargo distutils-r1

MY_PV="2.18.0"

DESCRIPTION="Fast data loading for TensorBoard"
HOMEPAGE="https://github.com/tensorflow/tensorboard"
SRC_URI="
	https://github.com/tensorflow/tensorboard/archive/refs/tags/${PV}.tar.gz -> tensorboard-${MY_PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"

S="${WORKDIR}"/tensorboard-${MY_PV}/tensorboard/data/server

export PROTOC=protoc

pkg_setup() {
	python-single-r1_pkg_setup
	rust_pkg_setup
}

src_prepare() {
	default
	mv pip_package/{setup.*,tensorboard_data_server} .
	distutils-r1_src_prepare
}

src_compile() {
	cargo_src_compile
	mkdir bin
	cp target/*/release/rustboard bin/server
	distutils-r1_src_compile
}

