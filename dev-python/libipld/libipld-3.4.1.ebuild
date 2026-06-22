# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )
RUST_MIN_VER="1.85.0"

CRATES="
	ansi_term@0.12.1
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.102
	atty@0.2.14
	base-x@0.2.11
	base256emoji@1.0.2
	bitflags@1.3.2
	cbor4ii@1.2.2
	cc@1.2.64
	cid@0.11.3
	clap@2.34.0
	clap@4.6.1
	clap_builder@4.6.0
	clap_lex@1.1.0
	colorchoice@1.0.5
	const-str@0.4.3
	data-encoding-macro-internal@0.1.18
	data-encoding-macro@0.1.20
	data-encoding@2.11.0
	find-msvc-tools@0.1.9
	heck@0.3.3
	heck@0.5.0
	hermit-abi@0.1.19
	is_terminal_polyfill@1.70.2
	lazy_static@1.5.0
	libc@0.2.186
	match-lookup@0.1.2
	multibase@0.9.2
	multihash@0.19.5
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	portable-atomic@1.13.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	python3-dll-a@0.2.15
	quote@1.0.45
	shlex@2.0.1
	strsim@0.11.1
	strsim@0.8.0
	structopt-derive@0.4.18
	structopt@0.3.26
	syn@1.0.109
	syn@2.0.118
	target-lexicon@0.13.5
	textwrap@0.11.0
	unicode-ident@1.0.24
	unicode-segmentation@1.13.3
	unicode-width@0.1.14
	unsigned-varint@0.8.0
	utf8parse@0.2.2
	vec_map@0.8.2
	version_check@0.9.5
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-link@0.2.1
	windows-sys@0.61.2
"

inherit cargo distutils-r1

DESCRIPTION="Python binding to the Rust IPLD library"
HOMEPAGE="https://github.com/MarshalX/python-libipld"
SRC_URI="
	https://github.com/MarshalX/python-libipld/archive/refs/tags/v${PV}.tar.gz -> python-${P}.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}"/python-${P}
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
