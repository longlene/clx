# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@0.7.18
	anyhow@1.0.58
	arbitrary@1.1.6
	arch@0.1.0
	argh@0.1.10
	argh_derive@0.1.10
	argh_shared@0.1.10
	async-task@4.3.0
	async-trait@0.1.56
	atty@0.2.14
	autocfg@1.1.0
	base@0.1.0
	bindgen@0.63.0
	bindgen@0.68.1
	bitflags@1.3.2
	bitflags@2.3.2
	bitreader@0.3.6
	byteorder@1.4.3
	bytes@1.2.0
	cbindgen@0.24.3
	cc@1.0.73
	cexpr@0.6.0
	cfg-if@1.0.0
	chrono@0.4.19
	clang-sys@1.4.0
	clap@3.2.23
	clap@4.1.8
	clap_derive@4.1.8
	clap_lex@0.2.4
	clap_lex@0.3.2
	crc32fast@1.3.2
	cros-codecs@0.0.4
	cros-libva@0.0.4
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.14
	crossbeam-utils@0.8.11
	ctrlc@3.2.5
	data_model@0.1.1-alpha.1
	dbus@0.9.6
	delegate@0.1.0
	derive-into-owned@0.1.0
	devices@0.1.0
	disk@0.1.0
	document-features@0.2.6
	downcast-rs@1.2.0
	either@1.7.0
	enumn@0.1.4
	env_logger@0.9.0
	errno@0.2.8
	errno-dragonfly@0.1.2
	euclid@0.22.7
	fastrand@1.8.0
	ffmpeg@0.1.0
	fixture@0.1.0
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.1.0
	futures@0.3.21
	futures-channel@0.3.21
	futures-core@0.3.21
	futures-executor@0.3.21
	futures-io@0.3.21
	futures-macro@0.3.21
	futures-sink@0.3.21
	futures-task@0.3.21
	futures-util@0.3.21
	gdbstub@0.7.0
	gdbstub_arch@0.3.0
	getrandom@0.2.7
	glob@0.3.0
	hashbrown@0.12.3
	heck@0.4.0
	hermit-abi@0.1.19
	hermit-abi@0.3.1
	humantime@2.1.0
	idna@0.3.0
	indexmap@1.9.1
	instant@0.1.12
	intrusive-collections@0.9.4
	io-lifetimes@1.0.5
	io_uring@0.1.1
	is-terminal@0.4.4
	itoa@1.0.2
	jail@0.1.0
	jobserver@0.1.24
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.150
	libdbus-sys@0.2.2
	libfuzzer-sys@0.4.4
	libloading@0.7.3
	libslirp-sys@4.2.1
	libtest-mimic@0.6.0
	linux-raw-sys@0.1.4
	litrs@0.2.3
	lock_api@0.4.9
	log@0.4.17
	managed@0.8.0
	memchr@2.5.0
	memoffset@0.5.6
	memoffset@0.6.5
	memoffset@0.8.0
	memoffset@0.9.0
	merge@0.1.0
	merge_derive@0.1.0
	metrics@0.1.0
	minimal-lexical@0.2.1
	named-lock@0.3.0
	nix@0.26.2
	nix@0.27.1
	nom@7.1.1
	num-integer@0.1.45
	num-traits@0.2.15
	num_cpus@1.13.1
	once_cell@1.17.0
	openssl@0.10.51
	openssl-macros@0.1.0
	openssl-sys@0.9.86
	os_str_bytes@6.4.1
	p9@0.2.3
	p9_wire_format_derive@0.2.3
	parking_lot@0.12.1
	parking_lot_core@0.9.6
	paste@1.0.7
	pcap-file@1.1.1
	peeking_take_while@0.1.2
	percent-encoding@2.2.0
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	pkg-config@0.3.26
	ppv-lite86@0.2.16
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.67
	protobuf@3.2.0
	protobuf-codegen@3.2.0
	protobuf-parse@3.2.0
	protobuf-support@3.2.0
	protos@0.1.0
	quote@0.3.15
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.3
	rayon@1.7.0
	rayon-core@1.11.0
	redox_syscall@0.2.15
	regex@1.6.0
	regex-syntax@0.6.27
	remain@0.2.6
	remove_dir_all@0.5.3
	resources@0.1.0
	rustc-hash@1.1.0
	rustix@0.36.8
	rutabaga_gfx@0.1.2
	ryu@1.0.10
	sandbox@0.1.0
	scopeguard@1.1.0
	scudo@0.1.3
	scudo-proc-macros@0.1.0
	scudo-sys@0.2.2
	serde@1.0.140
	serde_derive@1.0.140
	serde_json@1.0.82
	shlex@1.1.0
	slab@0.4.7
	smallvec@1.9.0
	static_assertions@1.1.0
	strsim@0.10.0
	syn@0.11.11
	syn@1.0.103
	syn@2.0.37
	synom@0.11.3
	tempfile@3.3.0
	termcolor@1.1.3
	textwrap@0.16.0
	thiserror@1.0.38
	thiserror-impl@1.0.38
	threadpool@1.8.1
	time@0.1.44
	tinyvec@1.6.0
	tinyvec_macros@0.1.0
	toml@0.5.9
	unicode-bidi@0.3.8
	unicode-ident@1.0.2
	unicode-normalization@0.1.22
	unicode-xid@0.0.4
	url@2.3.1
	userfaultfd@0.7.0
	userfaultfd-sys@0.5.0
	uuid@1.3.0
	vcpkg@0.2.15
	version_check@0.9.4
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	which@4.2.5
	widestring@0.5.1
	widestring@1.0.2
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.39.0
	windows-sys@0.42.0
	windows-sys@0.45.0
	windows-targets@0.42.1
	windows_aarch64_gnullvm@0.42.1
	windows_aarch64_msvc@0.39.0
	windows_aarch64_msvc@0.42.1
	windows_i686_gnu@0.39.0
	windows_i686_gnu@0.42.1
	windows_i686_msvc@0.39.0
	windows_i686_msvc@0.42.1
	windows_x86_64_gnu@0.39.0
	windows_x86_64_gnu@0.42.1
	windows_x86_64_gnullvm@0.42.1
	windows_x86_64_msvc@0.39.0
	windows_x86_64_msvc@0.42.1
	wio@0.2.2
	wmi@0.9.3
	x86_64@0.1.0
	zerocopy@0.7.5
	zerocopy-derive@0.7.5

	io-uring@0.1.1
"

inherit cargo

EGIT_COMMIT="a43f001bcc193e28f5c3122d361c0a33b74382d4"
MINIJAIL_COMMIT="13be56d79718425a60173f61f8174669d9cc8930"

DESCRIPTION="The Chrome OS Virtual Machine Monitor"
HOMEPAGE="https://crosvm.dev/"
SRC_URI="
	https://github.com/google/crosvm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/google/minijail/archive/${MINIJAIL_COMMIT}.tar.gz -> minijail-${MINIJAIL_COMMIT}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.31.0
	dev-libs/protobuf
"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	rmdir third_party/minijail && ln -sv "${WORKDIR}"/minijail-${MINIJAIL_COMMIT} third_party/minijail
}

src_install() {
	cargo_src_install
	einstalldocs
}
