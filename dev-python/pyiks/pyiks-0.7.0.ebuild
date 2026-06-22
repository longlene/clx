# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

CRATES="
	aws-lc-rs@1.16.3
	aws-lc-sys@0.40.0
	base64@0.22.1
	cc@1.2.61
	cfg-if@1.0.4
	cmake@0.1.58
	dunce@1.0.5
	find-msvc-tools@0.1.9
	fs_extra@1.3.0
	getrandom@0.2.17
	getrandom@0.3.4
	heck@0.5.0
	iks@0.7.0
	jobserver@0.1.34
	libc@0.2.186
	log@0.4.29
	once_cell@1.21.4
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.45
	r-efi@5.3.0
	ring@0.17.14
	rpassword@7.5.2
	rtoolbox@0.0.5
	rustls-pki-types@1.14.1
	rustls-webpki@0.103.13
	rustls@0.23.40
	shlex@1.3.0
	subtle@2.6.1
	syn@2.0.117
	target-lexicon@0.13.5
	unicode-ident@1.0.24
	untrusted@0.9.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.3+wasi-0.2.9
	webpki-roots@1.0.7
	windows-link@0.2.1
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-sys@0.61.2
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	wit-bindgen@0.57.1
	zeroize@1.8.2
"

RUST_MIN_VER="1.87.0"

inherit cargo distutils-r1

DESCRIPTION="Python bindings for the iksemel XML/XMPP library (Rust implementation)"
HOMEPAGE="https://github.com/meduketto/iksemel-python https://pypi.org/project/pyiks/"
SRC_URI="
	https://github.com/meduketto/iksemel-python/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/iksemel-python-${PV}"

LICENSE="LGPL-3+ Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD CDLA-Permissive-2.0 ISC MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="dev-build/cmake"
