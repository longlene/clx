# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	anyhow@1.0.102
	bitflags@2.11.1
	borrow-or-share@0.2.4
	bytes@1.11.1
	cfg-if@1.0.4
	countme@3.0.1
	crossbeam-utils@0.8.21
	dashmap@6.2.1
	equivalent@1.0.2
	errno@0.3.14
	fastrand@2.4.1
	fluent-uri@0.4.1
	foldhash@0.1.5
	futures-channel@0.3.32
	futures-core@0.3.32
	futures-io@0.3.32
	futures-macro@0.3.32
	futures-sink@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	futures@0.3.32
	getrandom@0.4.2
	hashbrown@0.14.5
	hashbrown@0.15.5
	hashbrown@0.17.1
	heck@0.5.0
	httparse@1.10.1
	id-arena@2.3.0
	indexmap@2.14.0
	itoa@1.0.18
	lazy_static@1.5.0
	leb128fmt@0.1.0
	libc@0.2.186
	linux-raw-sys@0.12.1
	lock_api@0.4.14
	log@0.4.29
	ls-types@0.0.6
	makefile-lossless@0.3.37
	memchr@2.8.0
	mio@1.2.0
	nu-ansi-term@0.50.3
	once_cell@1.21.4
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	percent-encoding@2.3.2
	pin-project-lite@0.2.17
	prettyplease@0.2.37
	proc-macro2@1.0.106
	quote@1.0.45
	r-efi@6.0.0
	redox_syscall@0.5.18
	ref-cast-impl@1.0.25
	ref-cast@1.0.25
	rowan@0.16.1
	rustc-hash@1.1.0
	rustix@1.1.4
	scopeguard@1.2.0
	semver@1.0.28
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	sharded-slab@0.1.7
	signal-hook-registry@1.4.8
	slab@0.4.12
	smallvec@1.15.1
	socket2@0.6.3
	syn@2.0.117
	sync_wrapper@1.0.2
	tempfile@3.27.0
	text-size@1.1.1
	thread_local@1.1.9
	tokio-macros@2.7.0
	tokio-util@0.7.18
	tokio@1.52.3
	tower-layer@0.3.3
	tower-lsp-server@0.23.0
	tower-service@0.3.3
	tower@0.5.3
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing-log@0.2.0
	tracing-subscriber@0.3.23
	tracing@0.1.44
	unicode-ident@1.0.24
	unicode-xid@0.2.6
	valuable@0.1.1
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.3+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasmparser@0.244.0
	windows-link@0.2.1
	windows-sys@0.61.2
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-bindgen@0.57.1
	wit-component@0.244.0
	wit-parser@0.244.0
	zmij@1.0.21
"

inherit cargo

DESCRIPTION="LSP for Makefiles"
HOMEPAGE="https://github.com/jelmer/makefile-lsp"
SRC_URI="
	https://github.com/jelmer/makefile-lsp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+=" MIT MIT-0 Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/makefile-lsp"
QA_PRESTRIPPED="usr/bin/makefile-lsp"

DOCS=(
	README.md
)

src_install() {
	cargo_src_install
	einstalldocs
}
