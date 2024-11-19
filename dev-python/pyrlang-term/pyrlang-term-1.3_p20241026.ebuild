# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

EGIT_COMMIT="bf762693bff43d7ccad15c854aa075f849bd0dbc"

CRATES="
	adler@1.0.2
	aho-corasick@0.7.19
	autocfg@1.1.0
	cfg-if@1.0.0
	cpython@0.7.2
	crc32fast@1.3.2
	flate2@1.0.22
	libc@0.2.118
	memchr@2.5.0
	miniz_oxide@0.4.4
	num-traits@0.2.14
	paste@1.0.6
	proc-macro2@1.0.36
	python3-sys@0.7.2
	quote@1.0.15
	regex-syntax@0.6.27
	regex@1.6.0
	syn@1.0.86
	thiserror-impl@1.0.30
	thiserror@1.0.30
	unicode-xid@0.2.2
"

inherit cargo distutils-r1

DESCRIPTION="Erlang Term and Codec for Python"
HOMEPAGE="https://github.com/Pyrlang/Term"
SRC_URI="
	https://github.com/Pyrlang/Term/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-python/setuptools-rust[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

S="${WORKDIR}"/Term-${EGIT_COMMIT}
