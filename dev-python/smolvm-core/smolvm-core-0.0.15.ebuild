# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	arc-swap@1.9.1
	bitflags@2.11.0
	bytes@1.11.1
	cfg-if@1.0.4
	cfg_aliases@0.2.1
	futures-channel@0.3.32
	futures-core@0.3.32
	futures-executor@0.3.32
	futures-io@0.3.32
	futures-macro@0.3.32
	futures-sink@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	futures@0.3.32
	heck@0.5.0
	libc@0.2.184
	log@0.4.29
	memchr@2.8.0
	mio@1.2.0
	netlink-packet-core@0.8.1
	netlink-packet-route@0.30.0
	netlink-proto@0.12.0
	netlink-sys@0.8.8
	nix@0.30.1
	once_cell@1.21.4
	paste@1.0.15
	pin-project-lite@0.2.17
	portable-atomic@1.13.1
	proc-macro2@1.0.106
	pyo3-build-config@0.28.3
	pyo3-ffi@0.28.3
	pyo3-log@0.13.3
	pyo3-macros-backend@0.28.3
	pyo3-macros@0.28.3
	pyo3@0.28.3
	quote@1.0.45
	rtnetlink@0.21.0
	rustversion@1.0.22
	slab@0.4.12
	socket2@0.6.3
	syn@2.0.117
	target-lexicon@0.13.5
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	tokio-macros@2.7.0
	tokio@1.51.1
	unicode-ident@1.0.24
	wasi@0.11.1+wasi-snapshot-preview1
	windows-link@0.2.1
	windows-sys@0.61.2
"

RUST_MIN_VER="1.85.0"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..14} )

inherit cargo distutils-r1

MY_PN="smolvm"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Rust-native core package for SmolVM"
HOMEPAGE="
	https://pypi.org/project/smolvm/
	https://github.com/CelestoAI/SmolVM
	https://docs.celesto.ai/smolvm
"
SRC_URI="
	https://github.com/CelestoAI/SmolVM/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
LICENSE+=" Apache-2.0-with-LLVM-exceptions MIT Unicode-3.0"
SLOT="0"
S="${WORKDIR}"/SmolVM-${PV}/smolvm-core
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
