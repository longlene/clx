# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_13 )

CRATES="
	atomic@0.6.0
	autocfg@1.4.0
	bitflags@2.9.1
	block-buffer@0.10.4
	bytemuck@1.23.0
	cfg-if@1.0.0
	crypto-common@0.1.6
	digest@0.10.7
	generic-array@0.14.7
	getrandom@0.2.16
	getrandom@0.3.3
	heck@0.5.0
	indoc@2.0.6
	libc@0.2.172
	md-5@0.10.6
	memoffset@0.9.1
	once_cell@1.21.3
	portable-atomic@1.11.0
	ppv-lite86@0.2.21
	proc-macro2@1.0.95
	pyo3-build-config@0.22.6
	pyo3-ffi@0.22.6
	pyo3-macros-backend@0.22.6
	pyo3-macros@0.22.6
	pyo3@0.22.6
	quote@1.0.40
	r-efi@5.2.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	sha1_smol@1.0.1
	syn@2.0.101
	target-lexicon@0.12.16
	typenum@1.18.0
	unicode-ident@1.0.18
	unindent@0.2.4
	uuid@1.16.0
	version_check@0.9.5
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.14.2+wasi-0.2.4
	wit-bindgen-rt@0.39.0
	zerocopy-derive@0.8.25
	zerocopy@0.8.25
"

inherit cargo distutils-r1

DESCRIPTION="Python bindings to Rust's UUID library."
HOMEPAGE="
	https://pypi.org/project/fastuuid/
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
