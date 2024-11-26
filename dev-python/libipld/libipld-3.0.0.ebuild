# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	ansi_term@0.12.1
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anstyle@1.0.10
	anyhow@1.0.93
	arrayref@0.3.9
	arrayvec@0.7.6
	atty@0.2.14
	autocfg@1.4.0
	base-x@0.2.11
	bitflags@1.3.2
	blake2b_simd@1.0.2
	blake2s_simd@1.0.2
	blake3@1.5.4
	block-buffer@0.10.4
	byteorder@1.5.0
	bytes@1.8.0
	cc@1.2.1
	cfg-if@1.0.0
	cid@0.10.1
	clap@2.34.0
	clap@4.5.21
	clap_builder@4.5.21
	clap_lex@0.7.3
	colorchoice@1.0.3
	constant_time_eq@0.3.1
	core2@0.4.0
	cpufeatures@0.2.16
	crypto-common@0.1.6
	data-encoding-macro-internal@0.1.13
	data-encoding-macro@0.1.15
	data-encoding@2.6.0
	digest@0.10.7
	fnv@1.0.7
	generic-array@0.14.7
	heck@0.3.3
	heck@0.5.0
	hermit-abi@0.1.19
	indoc@2.0.5
	is_terminal_polyfill@1.70.1
	itoa@1.0.13
	keccak@0.1.5
	lazy_static@1.5.0
	libc@0.2.164
	libipld-cbor-derive@0.16.0
	libipld-cbor@0.16.0
	libipld-core@0.16.0
	libipld-json@0.16.0
	libipld-macro@0.16.0
	libipld-pb@0.16.0
	libipld@0.16.0
	log@0.4.22
	memchr@2.7.4
	memoffset@0.9.1
	multibase@0.9.1
	multihash-derive@0.8.1
	multihash@0.18.1
	once_cell@1.20.2
	portable-atomic@1.10.0
	proc-macro-crate@1.1.3
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.92
	pyo3-build-config@0.22.6
	pyo3-ffi@0.22.6
	pyo3-macros-backend@0.22.6
	pyo3-macros@0.22.6
	pyo3@0.22.6
	python3-dll-a@0.2.10
	quick-protobuf@0.8.1
	quote@1.0.37
	ryu@1.0.18
	serde@1.0.215
	serde_derive@1.0.215
	serde_json@1.0.133
	sha2@0.10.8
	sha3@0.10.8
	shlex@1.3.0
	strsim@0.11.1
	strsim@0.8.0
	structopt-derive@0.4.18
	structopt@0.3.26
	syn@1.0.109
	syn@2.0.89
	synstructure@0.12.6
	target-lexicon@0.12.16
	textwrap@0.11.0
	thiserror-impl@1.0.69
	thiserror@1.0.69
	toml@0.5.11
	typenum@1.17.0
	unicode-ident@1.0.14
	unicode-segmentation@1.12.0
	unicode-width@0.1.14
	unicode-xid@0.2.6
	unindent@0.2.3
	unsigned-varint@0.7.2
	utf8parse@0.2.2
	vec_map@0.8.2
	version_check@0.9.5
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
"

inherit cargo distutils-r1

DESCRIPTION="Python binding to the Rust IPLD library"
HOMEPAGE="https://github.com/MarshalX/python-libipld"
SRC_URI="
	https://github.com/MarshalX/python-libipld/archive/refs/tags/v${PV}.tar.gz -> python-${P}.tar.gz
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

S="${WORKDIR}"/python-${P}

