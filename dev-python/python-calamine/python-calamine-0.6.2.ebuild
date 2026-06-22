# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

CRATES="
	adler2@2.0.1
	android_system_properties@0.1.5
	atoi_simd@0.17.0
	autocfg@1.5.0
	bitflags@2.10.0
	bumpalo@3.19.0
	bytecount@0.6.9
	byteorder@1.5.0
	calamine@0.33.0
	camino@1.2.1
	cargo-platform@0.1.9
	cargo_metadata@0.14.2
	cc@1.2.45
	cfg-if@1.0.4
	chrono@0.4.43
	codepage@0.1.2
	core-foundation-sys@0.8.7
	crc32fast@1.5.0
	debug_unsafe@0.1.3
	encoding_rs@0.8.35
	equivalent@1.0.2
	errno@0.3.14
	error-chain@0.12.4
	fast-float2@0.2.3
	fastrand@2.3.0
	find-msvc-tools@0.1.4
	flate2@1.1.5
	getrandom@0.3.4
	glob@0.3.3
	hashbrown@0.16.0
	heck@0.5.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.64
	indexmap@2.12.0
	itoa@1.0.15
	js-sys@0.3.82
	libc@0.2.177
	libz-rs-sys@0.5.2
	linux-raw-sys@0.11.0
	log@0.4.28
	memchr@2.7.6
	miniz_oxide@0.8.9
	num-traits@0.2.19
	once_cell@1.21.3
	portable-atomic@1.11.1
	proc-macro2@1.0.103
	pulldown-cmark@0.9.6
	pyo3-build-config@0.28.2
	pyo3-ffi@0.28.2
	pyo3-macros-backend@0.28.2
	pyo3-macros@0.28.2
	pyo3@0.28.2
	python3-dll-a@0.2.14
	quick-xml@0.38.4
	quote@1.0.42
	r-efi@5.3.0
	rustix@1.1.2
	rustversion@1.0.22
	ryu@1.0.20
	same-file@1.0.6
	semver@1.0.27
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.145
	shlex@1.3.0
	simd-adler32@0.3.7
	skeptic@0.13.7
	syn@2.0.110
	target-lexicon@0.13.3
	tempfile@3.23.0
	typed-path@0.12.2
	unicase@2.8.1
	unicode-ident@1.0.22
	version_check@0.9.5
	walkdir@2.5.0
	wasip2@1.0.1+wasi-0.2.4
	wasm-bindgen-macro-support@0.2.105
	wasm-bindgen-macro@0.2.105
	wasm-bindgen-shared@0.2.105
	wasm-bindgen@0.2.105
	winapi-util@0.1.11
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.61.2
	wit-bindgen@0.46.0
	zip@7.3.0
	zlib-rs@0.5.2
	zopfli@0.8.3
"

declare -A GIT_CRATES=(
	[pyo3-file]='https://github.com/dimastbk/pyo3-file;b0a5b260d13c6df14ea021b06c071a6f389fa805;pyo3-file-%commit%'
)

inherit cargo distutils-r1 pypi

DESCRIPTION="Python binding for Rust's calamine library for reading Excel and ODF files"
HOMEPAGE="https://github.com/dimastbk/python-calamine https://pypi.org/project/python-calamine/"
SRC_URI+=" ${CARGO_CRATE_URIS}"

S="${WORKDIR}/python_calamine-${PV}"

LICENSE="MIT Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"
