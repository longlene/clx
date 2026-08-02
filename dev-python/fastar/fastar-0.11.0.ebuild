# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

CRATES="
	adler2@2.0.1
	bitflags@2.11.0
	cc@1.2.60
	cfg-if@1.0.4
	crc32fast@1.5.0
	errno@0.3.14
	filetime@0.2.27
	find-msvc-tools@0.1.9
	flate2@1.1.9
	getrandom@0.3.4
	heck@0.5.0
	jobserver@0.1.34
	libc@0.2.185
	libredox@0.1.16
	linux-raw-sys@0.12.1
	miniz_oxide@0.8.9
	once_cell@1.21.4
	pkg-config@0.3.33
	plain@0.2.3
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.45
	r-efi@5.3.0
	redox_syscall@0.7.4
	rustix@1.1.4
	shlex@1.3.0
	simd-adler32@0.3.9
	syn@2.0.117
	tar@0.4.45
	target-lexicon@0.13.5
	unicode-ident@1.0.24
	wasip2@1.0.2+wasi-0.2.9
	windows-link@0.2.1
	windows-sys@0.61.2
	wit-bindgen@0.51.0
	xattr@1.6.1
	zstd-safe@7.2.4
	zstd-sys@2.0.16+zstd.1.5.7
	zstd@0.13.3
"

RUST_MIN_VER="1.87.0"

inherit cargo distutils-r1

DESCRIPTION="High-level bindings for the Rust tar crate"
HOMEPAGE="https://github.com/DoctorJohn/fastar"
SRC_URI="
	https://github.com/DoctorJohn/fastar/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}/${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
