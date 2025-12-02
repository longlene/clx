# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..14} )

CRATES="
	atomic@0.6.1
	autocfg@1.5.0
	block-buffer@0.10.4
	bumpalo@3.19.0
	bytemuck@1.24.0
	cfg-if@1.0.4
	crypto-common@0.1.6
	digest@0.10.7
	generic-array@0.14.9
	getrandom@0.2.16
	getrandom@0.3.4
	heck@0.5.0
	indoc@2.0.7
	js-sys@0.3.82
	libc@0.2.177
	md-5@0.10.6
	memoffset@0.9.1
	once_cell@1.21.3
	portable-atomic@1.11.1
	ppv-lite86@0.2.21
	proc-macro2@1.0.103
	pyo3-build-config@0.26.0
	pyo3-ffi@0.26.0
	pyo3-macros-backend@0.26.0
	pyo3-macros@0.26.0
	pyo3@0.26.0
	quote@1.0.42
	r-efi@5.3.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rustversion@1.0.22
	sha1_smol@1.0.1
	syn@2.0.110
	target-lexicon@0.13.3
	typenum@1.19.0
	unicode-ident@1.0.22
	unindent@0.2.4
	uuid@1.18.1
	version_check@0.9.5
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.1+wasi-0.2.4
	wasm-bindgen-macro-support@0.2.105
	wasm-bindgen-macro@0.2.105
	wasm-bindgen-shared@0.2.105
	wasm-bindgen@0.2.105
	wit-bindgen@0.46.0
	zerocopy-derive@0.8.27
	zerocopy@0.8.27
"

inherit cargo distutils-r1

DESCRIPTION="Python bindings to Rust's UUID library."
HOMEPAGE="
	https://pypi.org/project/fastuuid/
	https://github.com/fastuuid/fastuuid
"
SRC_URI="
	https://github.com/fastuuid/fastuuid/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
