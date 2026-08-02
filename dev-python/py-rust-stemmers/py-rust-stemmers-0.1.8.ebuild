# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

CRATES="
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	either@1.16.0
	heck@0.5.0
	libc@0.2.186
	once_cell@1.21.4
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.45
	rayon-core@1.13.0
	rayon@1.12.0
	rust-stemmers@1.2.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	syn@2.0.117
	target-lexicon@0.13.5
	unicode-ident@1.0.24
"

inherit cargo distutils-r1

DESCRIPTION="Fast and parallel snowball stemmer"
HOMEPAGE="https://github.com/qdrant/py-rust-stemmers https://pypi.org/project/py-rust-stemmers/"
SRC_URI="
	https://files.pythonhosted.org/packages/6b/c1/9763f9fb1cd73f9c317a83feeed6e0d4af320c6bbddab47b4a94f3a47d0c/py_rust_stemmers-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/py_rust_stemmers-${PV}"

LICENSE="MIT"
LICENSE+=" Apache-2.0-with-LLVM-exceptions Unicode-3.0 || ( Apache-2.0 MIT ) || ( BSD MIT )"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	${RUST_DEPEND}
	>=dev-util/maturin-1.13.3[${PYTHON_USEDEP}]
"

QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/py_rust_stemmers.*\.so"

src_unpack() {
	cargo_src_unpack
}
