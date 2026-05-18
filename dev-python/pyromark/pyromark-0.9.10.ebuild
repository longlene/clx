# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	bitflags@2.11.0
	heck@0.5.0
	libc@0.2.183
	memchr@2.8.0
	once_cell@1.21.4
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pulldown-cmark-escape@0.11.0
	pulldown-cmark@0.13.3
	pyo3-build-config@0.28.2
	pyo3-ffi@0.28.2
	pyo3-macros-backend@0.28.2
	pyo3-macros@0.28.2
	pyo3@0.28.2
	pythonize@0.28.0
	quote@1.0.45
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	syn@2.0.117
	target-lexicon@0.13.5
	unicase@2.9.0
	unicode-ident@1.0.24
"

RUST_MIN_VER="1.85.0"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..14} )

inherit cargo distutils-r1

DESCRIPTION="Blazingly fast Markdown parser for Python written in Rust"
HOMEPAGE="
	https://pypi.org/project/pyromark/
	https://github.com/monosans/pyromark
"
SRC_URI="
	https://github.com/monosans/pyromark/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
LICENSE+=" Apache-2.0-with-LLVM-exceptions MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
