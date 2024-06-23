# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	aho-corasick@1.1.3
	autocfg@1.3.0
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@2.5.0
	bstr@1.9.1
	cfg-if@1.0.0
	fancy-regex@0.11.0
	heck@0.4.1
	indoc@2.0.5
	libc@0.2.155
	lock_api@0.4.12
	memchr@2.7.4
	memoffset@0.9.1
	once_cell@1.19.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	portable-atomic@1.6.0
	proc-macro2@1.0.86
	pyo3@0.20.3
	pyo3-build-config@0.20.3
	pyo3-ffi@0.20.3
	pyo3-macros@0.20.3
	pyo3-macros-backend@0.20.3
	quote@1.0.36
	redox_syscall@0.5.2
	regex@1.10.5
	regex-automata@0.4.7
	regex-syntax@0.8.4
	rustc-hash@1.1.0
	scopeguard@1.2.0
	serde@1.0.203
	serde_derive@1.0.203
	smallvec@1.13.2
	syn@2.0.68
	target-lexicon@0.12.14
	unicode-ident@1.0.12
	unindent@0.2.3
	windows-targets@0.52.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.52.5
"

inherit cargo distutils-r1

DESCRIPTION="tiktoken is a fast BPE tokeniser for use with OpenAI's models"
HOMEPAGE="https://github.com/openai/tiktoken"
SRC_URI="
	https://github.com/openai/tiktoken/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/regex-2022.1.18[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-rust-1.5.2[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
