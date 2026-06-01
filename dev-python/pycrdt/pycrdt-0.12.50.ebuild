# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..14} )

CRATES="
	arc-swap@1.9.1
	async-lock@3.4.2
	async-trait@0.1.89
	bitflags@2.11.1
	bumpalo@3.20.2
	cfg-if@1.0.4
	concurrent-queue@2.5.0
	crossbeam-utils@0.8.21
	dashmap@6.1.0
	event-listener-strategy@0.5.4
	event-listener@5.4.1
	fastrand@2.4.1
	getrandom@0.3.4
	hashbrown@0.14.5
	heck@0.5.0
	itoa@1.0.18
	js-sys@0.3.97
	libc@0.2.186
	lock_api@0.4.14
	memchr@2.8.0
	once_cell@1.21.4
	parking@2.2.1
	parking_lot_core@0.9.12
	pin-project-lite@0.2.17
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.45
	r-efi@5.3.0
	redox_syscall@0.5.18
	rustversion@1.0.22
	scopeguard@1.2.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	smallstr@0.3.1
	smallvec@1.15.1
	syn@2.0.117
	target-lexicon@0.13.5
	thiserror-impl@2.0.18
	thiserror@2.0.18
	unicode-ident@1.0.24
	wasip2@1.0.3+wasi-0.2.9
	wasm-bindgen-macro-support@0.2.120
	wasm-bindgen-macro@0.2.120
	wasm-bindgen-shared@0.2.120
	wasm-bindgen@0.2.120
	windows-link@0.2.1
	wit-bindgen@0.57.1
	yrs@0.25.0
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
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
