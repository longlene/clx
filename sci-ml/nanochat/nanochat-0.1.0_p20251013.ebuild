# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..14} )

RUST_MIN_VER="1.85.0"
CRATES="
	ahash@0.8.12
	aho-corasick@1.1.3
	arc-swap@1.7.1
	autocfg@1.5.0
	bit-set@0.8.0
	bit-vec@0.8.0
	castaway@0.2.4
	cfg-if@1.0.3
	compact_str@0.9.0
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	dary_heap@0.3.7
	either@1.15.0
	equivalent@1.0.2
	fancy-regex@0.16.1
	getrandom@0.3.3
	hashbrown@0.15.5
	heck@0.5.0
	indexmap@2.11.0
	indoc@2.0.6
	itoa@1.0.15
	libc@0.2.175
	log@0.4.28
	memchr@2.7.5
	memoffset@0.9.1
	once_cell@1.21.3
	portable-atomic@1.11.1
	proc-macro2@1.0.101
	pyo3-build-config@0.23.5
	pyo3-ffi@0.23.5
	pyo3-log@0.12.4
	pyo3-macros-backend@0.23.5
	pyo3-macros@0.23.5
	pyo3@0.23.5
	quote@1.0.40
	r-efi@5.3.0
	rayon-core@1.13.0
	rayon@1.11.0
	regex-automata@0.4.10
	regex-syntax@0.8.6
	rustversion@1.0.22
	ryu@1.0.20
	static_assertions@1.1.0
	syn@2.0.106
	target-lexicon@0.12.16
	unicode-ident@1.0.18
	unindent@0.2.4
	version_check@0.9.5
	wasi@0.14.4+wasi-0.2.4
	wit-bindgen@0.45.1
	zerocopy-derive@0.8.26
	zerocopy@0.8.26
"

inherit cargo distutils-r1

EGIT_COMMIT="dd6ff9a1cc23b38ce69ddc119fb220f9ee96cedd"

DESCRIPTION="The minimal full-stack ChatGPT clone"
HOMEPAGE="
	https://github.com/karpathy/nanochat
"
SRC_URI="
	https://github.com/karpathy/nanochat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.8.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-4.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.22.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.117.1[${PYTHON_USEDEP}]
		>=dev-python/files-to-prompt-0.6[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/regex-2025.9.1[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.11.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.36.0[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.21.3[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	sed -e '/^\[tool\.maturin\]/a python-packages = ["nanochat"]' \
		-i pyproject.toml || die
  distutils-r1_src_prepare
}

