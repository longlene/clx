# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_13 )

CRATES="
	autocfg@1.4.0
	cfg-if@1.0.0
	evalexpr@12.0.2
	heck@0.5.0
	indoc@2.0.5
	libc@0.2.169
	memoffset@0.9.1
	once_cell@1.20.3
	portable-atomic@1.10.0
	proc-macro2@1.0.93
	pyo3-build-config@0.23.4
	pyo3-ffi@0.23.4
	pyo3-macros-backend@0.23.4
	pyo3-macros@0.23.4
	pyo3@0.23.4
	quote@1.0.38
	syn@2.0.98
	target-lexicon@0.12.16
	unicode-ident@1.0.16
	unindent@0.2.3
"

inherit cargo distutils-r1

DESCRIPTION="Python bindings for evalexpr Rust crate for safe expression evaluation"
HOMEPAGE="
	https://pypi.org/project/py-evalexpr/
"
SRC_URI="
	https://github.com/b-kiiskila/py_evalexpr/archive/refs/tags/1.0.3.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/py_evalexpr-${PV}
