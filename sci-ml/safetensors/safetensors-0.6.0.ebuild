# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	anes@0.1.6
	anstyle@1.0.11
	autocfg@1.5.0
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@2.9.1
	bumpalo@3.19.0
	cast@0.3.0
	cfg-if@1.0.1
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@4.5.40
	clap_builder@4.5.40
	clap_lex@0.7.5
	criterion-plot@0.5.0
	criterion@0.6.0
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	either@1.15.0
	equivalent@1.0.2
	errno@0.3.13
	fastrand@2.3.0
	fnv@1.0.7
	foldhash@0.1.5
	getrandom@0.3.3
	half@2.6.0
	hashbrown@0.15.4
	itertools@0.10.5
	itertools@0.13.0
	itoa@1.0.15
	js-sys@0.3.77
	lazy_static@1.5.0
	libc@0.2.174
	linux-raw-sys@0.9.4
	log@0.4.27
	memchr@2.7.5
	memmap2@0.9.5
	num-traits@0.2.19
	once_cell@1.21.3
	oorandom@11.1.5
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	ppv-lite86@0.2.21
	proc-macro2@1.0.95
	proptest@1.7.0
	quick-error@1.2.3
	quote@1.0.40
	r-efi@5.3.0
	rand@0.9.1
	rand_chacha@0.9.0
	rand_core@0.9.3
	rand_xorshift@0.4.0
	rayon-core@1.12.1
	rayon@1.10.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	rustix@1.0.7
	rustversion@1.0.21
	rusty-fork@0.3.0
	ryu@1.0.20
	same-file@1.0.6
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.140
	syn@2.0.104
	tempfile@3.20.0
	tinytemplate@1.2.1
	unarray@0.1.4
	unicode-ident@1.0.18
	wait-timeout@0.2.1
	walkdir@2.5.0
	wasi@0.14.2+wasi-0.2.4
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	web-sys@0.3.77
	winapi-util@0.1.9
	windows-sys@0.59.0
	windows-sys@0.60.2
	windows-targets@0.52.6
	windows-targets@0.53.2
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.0
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.0
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.0
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.0
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.0
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.0
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.0
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.0
	wit-bindgen-rt@0.39.0
	zerocopy-derive@0.8.26
	zerocopy@0.8.26
"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 cargo

DESCRIPTION="Simple, safe way to store and distribute tensors"
HOMEPAGE="
	https://pypi.org/project/safetensors/
	https://huggingface.co/
"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}"/${P}/bindings/python

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/lib/.*"
RESTRICT="test" #depends on single pkg ( pytorch )

BDEPEND="
	dev-python/setuptools-rust[${PYTHON_USEDEP}]
	test? (
		dev-python/h5py[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	default
	distutils-r1_src_prepare
	rm tests/test_{tf,paddle,flax}_comparison.py || die
	rm benches/test_{pt,tf,paddle,flax}.py || die
}

src_configure() {
	cargo_src_configure
	distutils-r1_src_configure
}

python_compile() {
	cargo_src_compile
	distutils-r1_python_compile
}

src_compile() {
	distutils-r1_src_compile
}

src_install() {
	distutils-r1_src_install
}
