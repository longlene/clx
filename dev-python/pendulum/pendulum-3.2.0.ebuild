# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )

CARGO_OPTIONAL=yes
CRATES="
	autocfg@1.5.0
	cc@1.2.55
	find-msvc-tools@0.1.9
	heck@0.5.0
	indoc@2.0.7
	libc@0.2.180
	memoffset@0.9.1
	once_cell@1.21.3
	portable-atomic@1.13.0
	proc-macro2@1.0.106
	pyo3-build-config@0.27.2
	pyo3-ffi@0.27.2
	pyo3-macros-backend@0.27.2
	pyo3-macros@0.27.2
	pyo3@0.27.2
	python3-dll-a@0.2.14
	quote@1.0.44
	rustversion@1.0.22
	shlex@1.3.0
	syn@2.0.114
	target-lexicon@0.13.4
	unicode-ident@1.0.22
	unindent@0.2.4
"

inherit cargo distutils-r1 pypi

DESCRIPTION="Python datetimes made easy"
HOMEPAGE="
	https://pendulum.eustace.io/
	https://github.com/sdispater/pendulum
	https://pypi.org/project/pendulum/
"
SRC_URI+=" ${CARGO_CRATE_URIS}"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/python-dateutil-2.6[${PYTHON_USEDEP}]
		dev-python/tzdata[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	${RUST_DEPEND}
	>=dev-util/maturin-1.0[${PYTHON_USEDEP}]
"

# Rust .so built without standard CFLAGS — acceptable for Rust
QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/pendulum/_pendulum.*.so"

RESTRICT="test"

src_unpack() {
	cargo_src_unpack
}
