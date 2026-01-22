# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..14} )

CRATES="
	ahash@0.8.12
	autocfg@1.5.0
	bytecount@0.6.9
	cfg-if@1.0.4
	chrono@0.4.43
	crunchy@0.2.4
	half@2.7.1
	itoa@1.0.17
	libc@0.2.180
	memoffset@0.9.1
	num-traits@0.2.19
	once_cell@1.21.3
	portable-atomic@1.13.0
	proc-macro2@1.0.105
	pyo3-build-config@0.27.2
	pyo3-ffi@0.27.2
	pyo3@0.27.2
	quote@1.0.43
	serde@1.0.228
	serde_bytes@0.11.19
	serde_core@1.0.228
	serde_derive@1.0.228
	simdutf8@0.1.5
	smallvec@1.15.1
	syn@2.0.114
	target-lexicon@0.13.4
	unicode-ident@1.0.22
	version_check@0.9.5
	zerocopy-derive@0.8.33
	zerocopy@0.8.33
"

RUST_MIN_VER="1.81"

inherit cargo distutils-r1

DESCRIPTION="MessagePack serialization library for Python derived from orjson"
HOMEPAGE="
	https://github.com/ormsgpack/ormsgpack
"
SRC_URI="
	https://github.com/ormsgpack/ormsgpack/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
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
