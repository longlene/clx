# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-0.7.18
	ansi_term-0.12.1
	anyhow-1.0.58
	arbitrary-1.1.6
	argh-0.1.8
	argh_derive-0.1.8
	argh_shared-0.1.8
	async-task-4.3.0
	async-trait-0.1.56
	atty-0.2.14
	autocfg-1.1.0
	bindgen-0.60.1
	bitflags-1.3.2
	bitreader-0.3.6
	byteorder-1.4.3
	bytes-1.2.0
	cbindgen-0.20.0
	cc-1.0.73
	cexpr-0.6.0
	cfg-if-1.0.0
	chrono-0.4.19
	clang-sys-1.4.0
	clap-2.34.0
	const-sha1-0.2.0
	crc32fast-1.3.2
	crossbeam-utils-0.8.11
	ctrlc-3.2.2
	dbus-0.9.6
	derive-into-owned-0.1.0
	document-features-0.2.6
	downcast-rs-1.2.0
	either-1.7.0
	enumn-0.1.4
	env_logger-0.9.0
	euclid-0.22.7
	fastrand-1.8.0
	ffmpeg-0.1.0
	fnv-1.0.7
	futures-0.3.21
	futures-channel-0.3.21
	futures-core-0.3.21
	futures-executor-0.3.21
	futures-io-0.3.21
	futures-macro-0.3.21
	futures-sink-0.3.21
	futures-task-0.3.21
	futures-util-0.3.21
	gdbstub-0.6.3
	gdbstub_arch-0.2.4
	getrandom-0.2.7
	glob-0.3.0
	hashbrown-0.12.3
	heck-0.3.3
	hermit-abi-0.1.19
	humantime-2.1.0
	indexmap-1.9.1
	instant-0.1.12
	intrusive-collections-0.9.4
	io-uring-0.5.8
	itoa-1.0.2
	jobserver-0.1.24
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.126
	libdbus-sys-0.2.2
	libfuzzer-sys-0.4.4
	libloading-0.7.3
	libslirp-sys-4.2.1
	libudev-0.2.0
	libudev-sys-0.1.4
	litrs-0.2.3
	log-0.4.17
	managed-0.8.0
	memchr-2.5.0
	memoffset-0.5.6
	memoffset-0.6.5
	merge-0.1.0
	merge_derive-0.1.0
	minimal-lexical-0.2.1
	mio-0.7.14
	miow-0.3.7
	nix-0.23.1
	nix-0.24.2
	nom-7.1.1
	ntapi-0.3.7
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.13.1
	once_cell-1.13.0
	paste-1.0.7
	pcap-file-1.1.1
	peeking_take_while-0.1.2
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	ppv-lite86-0.2.16
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.47
	protobuf-2.27.1
	protobuf-codegen-2.27.1
	protoc-2.27.1
	protoc-rust-2.27.1
	quote-0.3.15
	quote-1.0.21
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	redox_syscall-0.2.15
	regex-1.6.0
	regex-syntax-0.6.27
	remain-0.2.3
	remove_dir_all-0.5.3
	rustc-hash-1.1.0
	ryu-1.0.10
	scudo-0.1.3
	scudo-proc-macros-0.1.0
	scudo-sys-0.2.2
	serde-1.0.140
	serde_derive-1.0.140
	serde_json-1.0.82
	shlex-1.1.0
	slab-0.4.7
	smallvec-1.9.0
	static_assertions-1.1.0
	strsim-0.8.0
	syn-0.11.11
	syn-1.0.103
	synom-0.11.3
	tempfile-3.3.0
	termcolor-1.1.3
	terminal_size-0.1.17
	textwrap-0.11.0
	thiserror-1.0.31
	thiserror-impl-1.0.31
	time-0.1.44
	toml-0.5.9
	unicode-ident-1.0.2
	unicode-segmentation-1.9.0
	unicode-width-0.1.9
	unicode-xid-0.0.4
	userfaultfd-0.5.0
	userfaultfd-sys-0.4.2
	uuid-0.8.2
	vec_map-0.8.2
	version_check-0.9.4
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	which-4.2.5
	widestring-0.5.1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.10.0
	windows_gen-0.10.0
	windows_macros-0.10.0
	wio-0.2.2
	wmi-0.9.3
"

inherit cargo

EGIT_COMMIT="6e46da68bafe2f0899a02a1c6d3bd1284af23327"

DESCRIPTION="The Chrome OS Virtual Machine Monitor"
HOMEPAGE="https://crosvm.dev/"
SRC_URI="
	https://github.com/google/crosvm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/google/minijail/archive/c30d299f93f94a4ee4b786d15e1fb194f8709b9f.tar.gz -> minijail-c30d299f93f94a4ee4b786d15e1fb194f8709b9f.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.31.0
	dev-libs/protobuf
"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	rmdir third_party/minijail && ln -sv "${WORKDIR}"/minijail-c30d299f93f94a4ee4b786d15e1fb194f8709b9f third_party/minijail
}

src_install() {
	cargo_src_install
	einstalldocs
}
