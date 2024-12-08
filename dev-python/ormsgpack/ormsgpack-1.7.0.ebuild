# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	ahash@0.8.11
	autocfg@1.3.0
	bytecount@0.6.8
	byteorder@1.5.0
	cfg-if@1.0.0
	chrono@0.4.38
	crunchy@0.2.2
	half@2.4.1
	itoa@1.0.13
	libc@0.2.154
	memoffset@0.9.1
	num-traits@0.2.19
	once_cell@1.20.2
	paste@1.0.15
	portable-atomic@1.6.0
	proc-macro2@1.0.89
	pyo3-build-config@0.22.6
	pyo3-ffi@0.22.6
	pyo3@0.22.6
	quote@1.0.36
	rmp@0.8.14
	serde@1.0.215
	serde_bytes@0.11.15
	serde_derive@1.0.215
	simdutf8@0.1.5
	smallvec@1.13.2
	syn@2.0.82
	target-lexicon@0.12.14
	unicode-ident@1.0.12
	version_check@0.9.4
	zerocopy-derive@0.7.34
	zerocopy@0.7.34
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
