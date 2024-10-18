# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	anyhow@1.0.88
	autocfg@1.3.0
	base64@0.22.1
	bitflags@2.6.0
	bytes@1.7.1
	cc@1.1.18
	cesu8@1.1.0
	cfg-if@1.0.0
	combine@4.6.7
	core-foundation@0.9.4
	core-foundation-sys@0.8.7
	deranged@0.3.11
	getrandom@0.2.15
	heck@0.5.0
	indoc@2.0.5
	jni@0.19.0
	jni-sys@0.3.0
	libc@0.2.158
	log@0.4.22
	memchr@2.7.4
	memoffset@0.9.1
	num-bigint@0.4.6
	num-conv@0.1.0
	num-integer@0.1.46
	num-traits@0.2.19
	once_cell@1.19.0
	openssl-probe@0.1.5
	pem@3.0.4
	portable-atomic@1.7.0
	powerfmt@0.2.0
	proc-macro2@1.0.86
	pyo3@0.22.2
	pyo3-build-config@0.22.2
	pyo3-ffi@0.22.2
	pyo3-macros@0.22.2
	pyo3-macros-backend@0.22.2
	quote@1.0.37
	rcgen@0.13.1
	ring@0.17.8
	rustls@0.23.13
	rustls-native-certs@0.7.3
	rustls-pemfile@2.1.3
	rustls-pki-types@1.8.0
	rustls-platform-verifier@0.3.4
	rustls-platform-verifier-android@0.1.1
	rustls-webpki@0.102.8
	same-file@1.0.6
	schannel@0.1.24
	security-framework@2.11.1
	security-framework-sys@2.11.1
	serde@1.0.210
	serde_derive@1.0.210
	shlex@1.3.0
	socket2@0.5.7
	spin@0.9.8
	subtle@2.6.1
	syn@2.0.77
	target-lexicon@0.12.16
	thiserror@1.0.63
	thiserror-impl@1.0.63
	time@0.3.36
	time-core@0.1.2
	unicode-ident@1.0.13
	unindent@0.2.3
	untrusted@0.9.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	webpki-roots@0.26.5
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.52.0
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
	yasna@0.5.2
	zeroize@1.8.1
"

inherit cargo distutils-r1

DESCRIPTION="rustls-based modern TLS for Python"
HOMEPAGE="https://pypi.org/project/pyrtls/"
SRC_URI="
	https://github.com/djc/pyrtls/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
