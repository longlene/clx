# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	heck@0.5.0
	libc@0.2.186
	once_cell@1.21.4
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.29.0
	pyo3-ffi@0.29.0
	pyo3-macros-backend@0.29.0
	pyo3-macros@0.29.0
	pyo3@0.29.0
	quote@1.0.46
	syn@2.0.118
	target-lexicon@0.13.5
	unicode-ident@1.0.24
"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

inherit cargo distutils-r1

DESCRIPTION="Comment-pragma parallelization for ordinary Python code"
HOMEPAGE="https://github.com/fcmv/lucen"
SRC_URI="
	https://github.com/fcmv/lucen/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

# Apache-2.0: lucen itself. Rest: dependent Rust crate licenses.
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions Unicode-3.0 || ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( hypothesis )
distutils_enable_tests pytest
