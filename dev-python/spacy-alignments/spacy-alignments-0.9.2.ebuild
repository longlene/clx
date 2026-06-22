# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	autocfg@1.4.0
	cfg-if@1.0.0
	heck@0.5.0
	indoc@2.0.6
	libc@0.2.172
	memoffset@0.9.1
	once_cell@1.21.3
	portable-atomic@1.11.0
	proc-macro2@1.0.95
	pyo3-build-config@0.24.2
	pyo3-ffi@0.24.2
	pyo3-macros-backend@0.24.2
	pyo3-macros@0.24.2
	pyo3@0.24.2
	quote@1.0.40
	seqdiff@0.3.0
	syn@2.0.101
	target-lexicon@0.13.2
	tinyvec@1.9.0
	tinyvec_macros@0.1.1
	tokenizations@0.4.2
	unicode-ident@1.0.18
	unicode-normalization@0.1.24
	unindent@0.2.4
"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit cargo distutils-r1

DESCRIPTION="A spaCy package for the Rust tokenizations library"
HOMEPAGE="
	https://pypi.org/project/spacy-alignments/
	https://github.com/explosion/spacy-alignments
"
SRC_URI="
	https://github.com/explosion/spacy-alignments/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/spacy-alignments-release-v${PV}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
