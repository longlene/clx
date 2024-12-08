# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	ahash@0.8.11
	any_all_workaround@0.1.0
	associative-cache@2.0.0
	autocfg@1.1.0
	bitflags@1.3.2
	bytecount@0.6.8
	byteorder@1.5.0
	cfg-if@1.0.0
	chrono@0.4.38
	crunchy@0.2.2
	encoding_rs@0.8.34
	half@2.4.1
	itoa@1.0.11
	libc@0.2.151
	lock_api@0.4.11
	memoffset@0.9.0
	num-traits@0.2.17
	once_cell@1.19.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	portable-atomic@1.6.0
	proc-macro2@1.0.74
	pyo3-build-config@0.21.2
	pyo3-ffi@0.21.2
	pyo3@0.21.2
	quote@1.0.35
	redox_syscall@0.4.1
	rmp-serde@1.2.0
	rmp@0.8.14
	scopeguard@1.2.0
	serde@1.0.198
	serde_bytes@0.11.14
	serde_derive@1.0.198
	smallvec@1.13.2
	syn@2.0.46
	target-lexicon@0.12.12
	unicode-ident@1.0.12
	version_check@0.9.4
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
"

inherit distutils-r1 cargo

DESCRIPTION=""
HOMEPAGE="https://github.com/aviramha/ormsgpack"
SRC_URI="
	https://github.com/aviramha/ormsgpack/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
