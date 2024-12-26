# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	aho-corasick@1.0.2
	arrayvec@0.7.2
	autocfg@1.1.0
	bitflags@1.3.2
	castaway@0.2.2
	cfg-if@1.0.0
	compact_str@0.7.1
	delegate-attr@0.2.9
	duplex@0.15.0
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-timer@3.0.2
	futures-util@0.3.28
	futures@0.3.28
	glob@0.3.1
	indoc@1.0.7
	io-extras@0.17.4
	io-lifetimes@1.0.4
	itoa@1.0.6
	libc@0.2.138
	lock_api@0.4.9
	memchr@2.5.0
	num-bigint@0.4.3
	num-integer@0.1.45
	num-traits@0.2.15
	once_cell@1.16.0
	owned_chars@0.3.2
	parking_lot@0.12.1
	parking_lot_core@0.9.5
	pin-project-lite@0.2.10
	pin-utils@0.1.0
	proc-macro2@1.0.64
	pyo3-build-config@0.16.6
	pyo3-ffi@0.16.6
	pyo3-macros-backend@0.16.6
	pyo3-macros@0.16.6
	pyo3@0.16.6
	quote@1.0.29
	redox_syscall@0.2.16
	regex-automata@0.3.3
	regex-syntax@0.7.4
	regex@1.9.1
	relative-path@1.8.0
	rstest@0.18.1
	rstest_macros@0.18.1
	rustc_version@0.4.0
	rustversion@1.0.12
	ryu@1.0.13
	scopeguard@1.1.0
	semver@1.0.17
	slab@0.4.8
	smallvec@1.10.0
	static_assertions@1.1.0
	syn@1.0.105
	syn@2.0.25
	target-lexicon@0.12.5
	thiserror-impl@1.0.37
	thiserror@1.0.37
	unicode-ident@1.0.5
	unindent@0.1.10
	utf8-chars@2.0.3
	utf8-io@0.16.0
	utf8-width@0.1.6
	windows-sys@0.42.0
	windows-sys@0.48.0
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.42.0
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.0
	windows_x86_64_msvc@0.48.0
"

declare -A GIT_CRATES=(
	[utf8-read]='https://github.com/smheidrich/utf8-read-rs;0690310179a4fad9304101c1a431f19cfb809bbe;utf8-read-rs-%commit%'
)

inherit cargo distutils-r1

DESCRIPTION="A faster tokenizer for the json-stream Python library"
HOMEPAGE="
	https://github.com/smheidrich/py-json-stream-rs-tokenizer
	https://pypi.org/project/json-stream-rs-tokenizer/
"
SRC_URI="
	https://github.com/smheidrich/py-json-stream-rs-tokenizer/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	dev-python/setuptools-rust[${PYTHON_USEDEP}]
	test? (
		>=dev-python/json-stream-2.3.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}"/py-${P}
