# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	aho-corasick@1.1.3
	autocfg@1.4.0
	bit-set@0.5.3
	bit-vec@0.6.3
	bstr@1.11.0
	cfg-if@1.0.0
	fancy-regex@0.13.0
	heck@0.5.0
	indoc@2.0.5
	libc@0.2.167
	memchr@2.7.4
	memoffset@0.9.1
	once_cell@1.20.2
	portable-atomic@1.10.0
	proc-macro2@1.0.92
	pyo3-build-config@0.22.6
	pyo3-ffi@0.22.6
	pyo3-macros-backend@0.22.6
	pyo3-macros@0.22.6
	pyo3@0.22.6
	quote@1.0.37
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	rustc-hash@1.1.0
	serde@1.0.215
	serde_derive@1.0.215
	syn@2.0.90
	target-lexicon@0.12.16
	unicode-ident@1.0.14
	unindent@0.2.3
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
