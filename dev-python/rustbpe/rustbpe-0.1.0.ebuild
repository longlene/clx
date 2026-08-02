# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

CRATES="
	ahash@0.8.12
	aho-corasick@1.1.4
	anes@0.1.6
	anstyle@1.0.13
	arc-swap@1.8.0
	autocfg@1.5.0
	bit-set@0.8.0
	bit-vec@0.8.0
	bumpalo@3.19.1
	cast@0.3.0
	castaway@0.2.4
	cfg-if@1.0.4
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@4.5.54
	clap_builder@4.5.54
	clap_lex@0.7.6
	compact_str@0.9.0
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	dary_heap@0.3.8
	either@1.15.0
	equivalent@1.0.2
	fancy-regex@0.16.2
	getrandom@0.3.4
	half@2.7.1
	hashbrown@0.16.1
	heck@0.5.0
	hermit-abi@0.5.2
	indexmap@2.12.1
	indoc@2.0.7
	is-terminal@0.4.17
	itertools@0.10.5
	itoa@1.0.17
	js-sys@0.3.83
	libc@0.2.179
	log@0.4.29
	memchr@2.7.6
	memoffset@0.9.1
	num-traits@0.2.19
	once_cell@1.21.3
	oorandom@11.1.5
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	portable-atomic@1.13.0
	proc-macro2@1.0.104
	pyo3-build-config@0.27.2
	pyo3-ffi@0.27.2
	pyo3-log@0.13.2
	pyo3-macros-backend@0.27.2
	pyo3-macros@0.27.2
	pyo3@0.27.2
	quote@1.0.42
	r-efi@5.3.0
	rayon-core@1.13.0
	rayon@1.11.0
	regex-automata@0.4.13
	regex-syntax@0.8.8
	regex@1.12.2
	rustversion@1.0.22
	ryu@1.0.22
	same-file@1.0.6
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.148
	static_assertions@1.1.0
	syn@2.0.112
	target-lexicon@0.13.4
	tinytemplate@1.2.1
	unicode-ident@1.0.22
	unindent@0.2.4
	version_check@0.9.5
	walkdir@2.5.0
	wasip2@1.0.1+wasi-0.2.4
	wasm-bindgen-macro-support@0.2.106
	wasm-bindgen-macro@0.2.106
	wasm-bindgen-shared@0.2.106
	wasm-bindgen@0.2.106
	web-sys@0.3.83
	winapi-util@0.1.11
	windows-link@0.2.1
	windows-sys@0.61.2
	wit-bindgen@0.46.0
	zerocopy-derive@0.8.31
	zerocopy@0.8.31
	zmij@1.0.9
"

RUST_MIN_VER="1.82.0"

inherit cargo distutils-r1 pypi

DESCRIPTION="BPE tokenizer written in Rust with Python bindings"
HOMEPAGE="https://pypi.org/project/rustbpe/"
SRC_URI="
	$(pypi_sdist_url rustbpe ${PV})
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

distutils_enable_tests pytest

src_unpack() {
	cargo_src_unpack
}
