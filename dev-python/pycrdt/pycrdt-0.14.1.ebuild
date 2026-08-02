# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

CRATES="
	arc-swap@1.9.1
	async-lock@3.4.2
	async-trait@0.1.89
	bitflags@2.13.0
	bumpalo@3.20.3
	cfg-if@1.0.4
	concurrent-queue@2.5.0
	crossbeam-utils@0.8.21
	dashmap@6.2.1
	event-listener-strategy@0.5.4
	event-listener@5.4.1
	fastrand@2.4.1
	futures-core@0.3.32
	futures-io@0.3.32
	futures-lite@2.6.1
	futures-task@0.3.32
	getrandom@0.3.4
	hashbrown@0.14.5
	heck@0.5.0
	itoa@1.0.18
	js-sys@0.3.102
	libc@0.2.186
	lock_api@0.4.14
	memchr@2.8.2
	once_cell@1.21.4
	parking@2.2.1
	parking_lot_core@0.9.12
	pin-project-lite@0.2.17
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.29.0
	pyo3-ffi@0.29.0
	pyo3-macros-backend@0.29.0
	pyo3-macros@0.29.0
	pyo3@0.29.0
	quote@1.0.46
	r-efi@5.3.0
	redox_syscall@0.5.18
	rustversion@1.0.22
	scopeguard@1.2.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	smallstr@0.3.1
	smallvec@1.15.2
	syn@2.0.118
	target-lexicon@0.13.5
	thiserror-impl@2.0.18
	thiserror@2.0.18
	unicode-ident@1.0.24
	wasip2@1.0.4+wasi-0.2.12
	wasm-bindgen-macro-support@0.2.125
	wasm-bindgen-macro@0.2.125
	wasm-bindgen-shared@0.2.125
	wasm-bindgen@0.2.125
	windows-link@0.2.1
	wit-bindgen@0.57.1
	yrs@0.27.2
	zmij@1.0.21
"

RUST_MIN_VER="1.87.0"

inherit cargo distutils-r1

DESCRIPTION="Python bindings for Yrs"
HOMEPAGE="
	https://pypi.org/project/pycrdt/
	https://github.com/y-crdt/pycrdt
"
SRC_URI="
	https://github.com/y-crdt/pycrdt/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anyio-4.4.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
