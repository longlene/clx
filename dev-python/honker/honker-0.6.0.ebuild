# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..15} )

RUST_MIN_VER="1.85.0"

# honker-core is a path dependency (../../honker-core in the same
# monorepo tarball) and is not on crates.io, so it is not listed here.
CRATES="
	android_system_properties@0.1.6
	autocfg@1.5.1
	bitflags@2.13.2
	bumpalo@3.20.3
	cc@1.4.7
	cfg-if@1.0.5
	chrono@0.4.45
	core-foundation-sys@0.8.7
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	file-id@0.2.3
	find-msvc-tools@0.1.13
	foldhash@0.2.0
	fsevent-sys@4.1.0
	futures-core@0.3.34
	futures-task@0.3.34
	futures-util@0.3.34
	hashbrown@0.16.1
	hashbrown@0.17.1
	hashlink@0.12.2
	heck@0.5.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	inotify-sys@0.1.8
	inotify@0.11.5
	itoa@1.0.18
	js-sys@0.3.105
	kqueue-sys@1.1.2
	kqueue@1.2.1
	libc@0.2.189
	libsqlite3-sys@0.38.2
	lock_api@0.4.14
	log@0.4.34
	memchr@2.8.3
	memmap2@0.9.11
	mio@1.2.3
	notify-types@2.1.0
	notify@8.2.0
	num-traits@0.2.19
	once_cell@1.21.4
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	pin-project-lite@0.2.17
	pkg-config@0.3.34
	portable-atomic@1.15.0
	proc-macro2@1.0.107
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.47
	redox_syscall@0.5.18
	rsqlite-vfs@0.1.1
	rusqlite@0.40.2
	rustversion@1.0.23
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	shlex@2.0.1
	slab@0.4.12
	smallvec@1.16.1
	sqlite-wasm-rs@0.5.5
	syn@2.0.119
	syn@3.0.6
	target-lexicon@0.13.5
	thiserror-impl@2.0.20
	thiserror@2.0.20
	unicode-ident@1.0.26
	vcpkg@0.2.15
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasm-bindgen-macro-support@0.2.128
	wasm-bindgen-macro@0.2.128
	wasm-bindgen-shared@0.2.128
	wasm-bindgen@0.2.128
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
	zmij@1.0.23
"

inherit cargo distutils-r1

DESCRIPTION="Durable queues, streams, pub/sub and cron scheduler on SQLite"
HOMEPAGE="
	https://github.com/russellromney/honker
	https://honker.dev
	https://pypi.org/project/honker/
"
SRC_URI="
	https://github.com/russellromney/honker/archive/refs/tags/rb-v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}/honker-rb-v${PV}/packages/honker"
LICENSE="CC0-1.0 ISC MIT Unicode-3.0 ZLIB || ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

# The upstream test suite lives at the monorepo root, outside of S;
# the only file here (test_basic.py) is a manual script.
RESTRICT="test"

RDEPEND="${PYTHON_DEPS}"
DEPEND="
	dev-db/sqlite:3=
	${RDEPEND}
"
BDEPEND="
	${DEPEND}
	dev-util/maturin[${PYTHON_USEDEP}]
"

PATCHES=( "${FILESDIR}/${P}-Cargo.lock.patch" )

QA_FLAGS_IGNORED="usr/lib/py.*/site-packages/honker/_honker_native*.so"

pkg_setup() {
	distutils-r1_pkg_setup
	rust_pkg_setup
}

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	distutils-r1_src_prepare
}
