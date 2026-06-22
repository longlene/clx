# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	approx@0.5.1
	autocfg@1.5.0
	bitflags@2.11.0
	block-buffer@0.10.4
	bytemuck@1.25.0
	bytemuck_derive@1.10.2
	byteorder@1.5.0
	cblas-sys@0.1.4
	cfg-if@1.0.4
	coe-rs@0.1.2
	cpufeatures@0.2.17
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	crypto-common@0.1.7
	dbgf@0.1.2
	digest@0.10.7
	dyn-stack-macros@0.1.3
	dyn-stack@0.11.0
	dyn-stack@0.13.2
	either@1.15.0
	enum-as-inner@0.6.1
	equator-macro@0.2.1
	equator-macro@0.4.2
	equator@0.2.2
	equator@0.4.2
	faer-entity@0.20.1
	faer@0.20.2
	gemm-c32@0.18.2
	gemm-c64@0.18.2
	gemm-common@0.18.2
	gemm-f16@0.18.2
	gemm-f32@0.18.2
	gemm-f64@0.18.2
	gemm@0.18.2
	generativity@1.1.0
	generic-array@0.14.7
	getrandom@0.2.17
	half@2.7.1
	heck@0.5.0
	indoc@2.0.7
	libc@0.2.184
	libm@0.2.16
	matrixcompare-core@0.1.0
	matrixcompare@0.3.0
	matrixmultiply@0.3.10
	memchr@2.8.0
	memoffset@0.9.1
	nalgebra-macros@0.2.2
	nalgebra@0.32.6
	nano-gemm-c32@0.1.0
	nano-gemm-c64@0.1.0
	nano-gemm-codegen@0.1.0
	nano-gemm-core@0.1.0
	nano-gemm-f32@0.1.0
	nano-gemm-f64@0.1.0
	nano-gemm@0.1.3
	ndarray@0.17.2
	npyz@0.8.4
	num-bigint@0.4.6
	num-complex@0.4.6
	num-integer@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	numpy@0.27.1
	once_cell@1.21.4
	ordered-float@4.6.0
	paste@1.0.15
	pest@2.8.6
	pest_derive@2.8.6
	pest_generator@2.8.6
	pest_meta@2.8.6
	portable-atomic-util@0.2.6
	portable-atomic@1.13.1
	ppv-lite86@0.2.21
	proc-macro2@1.0.106
	pulp@0.18.22
	pulp@0.21.5
	py_literal@0.4.0
	pyo3-build-config@0.27.2
	pyo3-ffi@0.27.2
	pyo3-macros-backend@0.27.2
	pyo3-macros@0.27.2
	pyo3@0.27.2
	quote@1.0.45
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	raw-cpuid@11.6.0
	rawpointer@0.2.1
	rayon-core@1.13.0
	rayon@1.11.0
	reborrow@0.5.5
	rustc-hash@2.1.2
	rustversion@1.0.22
	safe_arch@0.7.4
	same-file@1.0.6
	seq-macro@0.3.6
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	sha2@0.10.9
	simba@0.8.1
	statrs@0.17.1
	syn@2.0.117
	sysctl@0.6.0
	target-lexicon@0.13.5
	thiserror-impl@1.0.69
	thiserror@1.0.69
	typenum@1.19.0
	ucd-trie@0.1.7
	unicode-ident@1.0.24
	unindent@0.2.4
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wide@0.7.33
	winapi-util@0.1.11
	windows-link@0.2.1
	windows-sys@0.61.2
	zerocopy-derive@0.8.48
	zerocopy@0.8.48
"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

inherit cargo distutils-r1 pypi

DESCRIPTION="Fast vector quantization with 2-4 bit compression and SIMD search"
HOMEPAGE="https://github.com/RyanCodrai/turbovec https://pypi.org/project/turbovec/"
SRC_URI+="
	${CARGO_CRATE_URIS}
"

LICENSE="MIT Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

DEPEND="sci-libs/openblas:="
RDEPEND="${DEPEND}
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
