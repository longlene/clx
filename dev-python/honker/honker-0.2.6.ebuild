# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	android_system_properties@0.1.5
	autocfg@1.5.1
	bitflags@1.3.2
	bitflags@2.13.0
	bumpalo@3.20.3
	cc@1.2.63
	cfg-if@1.0.4
	chrono@0.4.45
	core-foundation-sys@0.8.7
	crossbeam-channel@0.5.15
	crossbeam-utils@0.8.21
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	file-id@0.2.3
	filetime@0.2.29
	find-msvc-tools@0.1.9
	foldhash@0.2.0
	fsevent-sys@4.1.0
	futures-core@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	hashbrown@0.16.1
	hashlink@0.11.1
	heck@0.5.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	inotify-sys@0.1.5
	inotify@0.9.6
	js-sys@0.3.100
	kqueue-sys@1.1.2
	kqueue@1.2.0
	libc@0.2.186
	libsqlite3-sys@0.37.0
	lock_api@0.4.14
	log@0.4.32
	memmap2@0.9.10
	mio@0.8.11
	notify@6.1.1
	num-traits@0.2.19
	once_cell@1.21.4
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	pin-project-lite@0.2.17
	pkg-config@0.3.33
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.45
	redox_syscall@0.5.18
	rsqlite-vfs@0.1.1
	rusqlite@0.39.0
	rustversion@1.0.22
	same-file@1.0.6
	scopeguard@1.2.0
	shlex@2.0.1
	slab@0.4.12
	smallvec@1.15.1
	sqlite-wasm-rs@0.5.5
	syn@2.0.117
	target-lexicon@0.13.5
	thiserror-impl@2.0.18
	thiserror@2.0.18
	unicode-ident@1.0.24
	vcpkg@0.2.15
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasm-bindgen-macro-support@0.2.123
	wasm-bindgen-macro@0.2.123
	wasm-bindgen-shared@0.2.123
	wasm-bindgen@0.2.123
	winapi-util@0.1.11
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.48.0
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.48.5
	windows-targets@0.53.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.53.1
"

RUST_MIN_VER="1.85.0"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

inherit cargo distutils-r1

DESCRIPTION="SQLite extension + bindings for Postgres NOTIFY/LISTEN semantics with durable queues, streams, pub/sub, and scheduler"
HOMEPAGE="
	https://pypi.org/project/honker/
	https://github.com/russellromney/honker
	https://honker.dev/
"
SRC_URI="
	https://github.com/russellromney/honker/archive/refs/tags/py-v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}"/${PN}-py-v${PV}/packages/${PN}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
