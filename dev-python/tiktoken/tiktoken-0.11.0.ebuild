# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

CRATES="
	aho-corasick@1.1.3
	autocfg@1.5.0
	bit-set@0.5.3
	bit-vec@0.6.3
	bstr@1.12.0
	cfg-if@1.0.3
	fancy-regex@0.13.0
	heck@0.5.0
	indoc@2.0.6
	libc@0.2.175
	memchr@2.7.5
	memoffset@0.9.1
	once_cell@1.21.3
	portable-atomic@1.11.1
	proc-macro2@1.0.101
	pyo3-build-config@0.24.2
	pyo3-ffi@0.24.2
	pyo3-macros-backend@0.24.2
	pyo3-macros@0.24.2
	pyo3@0.24.2
	quote@1.0.40
	regex-automata@0.4.10
	regex-syntax@0.8.6
	regex@1.11.2
	rustc-hash@1.1.0
	serde@1.0.225
	serde_core@1.0.225
	serde_derive@1.0.225
	syn@2.0.106
	target-lexicon@0.13.3
	unicode-ident@1.0.19
	unindent@0.2.4
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
