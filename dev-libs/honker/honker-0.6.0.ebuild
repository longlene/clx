# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	android_system_properties@0.1.5
	autocfg@1.5.0
	bitflags@2.11.1
	bumpalo@3.20.2
	cc@1.2.61
	cfg-if@1.0.4
	chrono-tz@0.10.4
	chrono@0.4.45
	core-foundation-sys@0.8.7
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	file-id@0.2.3
	find-msvc-tools@0.1.9
	foldhash@0.2.0
	fsevent-sys@4.1.0
	futures-core@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	hashbrown@0.16.1
	hashbrown@0.17.1
	hashlink@0.12.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	inotify-sys@0.1.8
	inotify@0.11.4
	itoa@1.0.18
	js-sys@0.3.97
	kqueue-sys@1.1.0
	kqueue@1.1.1
	libc@0.2.189
	libsqlite3-sys@0.38.1
	lock_api@0.4.14
	log@0.4.29
	memchr@2.8.3
	memmap2@0.9.11
	mio@1.2.2
	notify-types@2.1.0
	notify@8.2.0
	num-traits@0.2.19
	once_cell@1.21.4
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	phf@0.12.1
	phf_shared@0.12.1
	pin-project-lite@0.2.17
	pkg-config@0.3.33
	prettyplease@0.2.37
	proc-macro2@1.0.106
	quote@1.0.45
	redox_syscall@0.5.18
	rsqlite-vfs@0.1.0
	rusqlite@0.40.1
	rustversion@1.0.22
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.151
	shlex@1.3.0
	siphasher@1.0.3
	slab@0.4.12
	smallvec@1.15.1
	sqlite-wasm-rs@0.5.3
	syn@2.0.117
	syn@3.0.3
	thiserror-impl@2.0.19
	thiserror@2.0.19
	unicode-ident@1.0.24
	vcpkg@0.2.15
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasm-bindgen-macro-support@0.2.120
	wasm-bindgen-macro@0.2.120
	wasm-bindgen-shared@0.2.120
	wasm-bindgen@0.2.120
	winapi-util@0.1.11
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.53.5
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.53.1
	zmij@1.0.21
"

RUST_MIN_VER="1.85.0"

inherit cargo

DESCRIPTION="SQLite loadable extension with Postgres-style NOTIFY/LISTEN and durable queues"
HOMEPAGE="
	https://github.com/russellromney/honker
	https://honker.dev
"
SRC_URI="
	https://github.com/russellromney/honker/archive/refs/tags/rb-v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}/honker-rb-v${PV}"

LICENSE="CC0-1.0 ISC MIT Unicode-3.0 ZLIB || ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-db/sqlite:3="
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
"

pkg_setup() {
	rust_pkg_setup
}

src_configure() {
	cargo_src_configure
}

src_install() {
	insinto /usr/lib/honker
	doins target/release/libhonker_ext.so
	dodoc README.md CHANGELOG.md BINDINGS.md
}
