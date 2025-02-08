# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	adler32@1.2.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	autocfg@1.4.0
	byteorder@1.5.0
	cc@1.2.9
	cedarwood@0.4.6
	cfg-if@1.0.0
	core2@0.4.0
	crc32fast@1.4.2
	dary_heap@0.3.7
	fxhash@0.2.1
	hashbrown@0.14.5
	heck@0.5.0
	include-flate-codegen@0.2.0
	include-flate@0.3.0
	indoc@2.0.5
	jieba-macros@0.7.1
	jieba-rs@0.7.1
	lazy_static@1.5.0
	libc@0.2.169
	libflate@2.1.0
	libflate_lz77@2.1.0
	memchr@2.7.4
	memoffset@0.9.1
	once_cell@1.20.2
	phf@0.11.3
	phf_codegen@0.11.3
	phf_generator@0.11.3
	phf_shared@0.11.3
	portable-atomic@1.10.0
	proc-macro2@1.0.93
	pyo3-build-config@0.23.4
	pyo3-ffi@0.23.4
	pyo3-macros-backend@0.23.4
	pyo3-macros@0.23.4
	pyo3@0.23.4
	python3-dll-a@0.2.12
	quote@1.0.38
	rand@0.8.5
	rand_core@0.6.4
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	rle-decode-fast@1.0.3
	shlex@1.3.0
	siphasher@1.0.1
	smallvec@1.13.2
	syn@2.0.96
	target-lexicon@0.12.16
	unicode-ident@1.0.14
	unindent@0.2.3
	version_check@0.9.5
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
"

inherit cargo distutils-r1

DESCRIPTION="jieba-rs Python binding"
HOMEPAGE="
	https://github.com/messense/rjieba-py
	https://pypi.org/project/rjieba/
"
SRC_URI="
	https://github.com/messense/rjieba-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
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

S="${WORKDIR}"/rjieba-py-${PV}
